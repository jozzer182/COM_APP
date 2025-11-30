import 'dart:convert';

import 'package:http/http.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/env_config.dart';
import '../model/usdcop.dart';

Future onLoadUsdcop(event, emit, MainState Function() state) async {
  print('Hello from onLoadUsdcop');
  Usdcop usdcop = Usdcop();
  try {
    print('onLoadLm');
    await usdcop.obtener();
    String date = '';
    String close = '';

    Map<String, Object> dataSend = {
      "info": {"libro": "USDCOP", "hoja": "USDCOP"},
      "fname": "getHoja",
    };
    // print(jsonEncode(dataSend));

    Response response = await post(
      Uri.parse(EnvConfig.apiUsdCop),
      body: jsonEncode(dataSend),
    );
    // print('EurCOP response.body: ${response.body}');
    List dataAsListMap;
    // if (response.statusCode == 302) {
    //   Response response2 = await get(
    //     Uri.parse(response.headers["location"] ?? ''),
    //   );
    //   dataAsListMap = jsonDecode(response2.body);
    // } else {
      dataAsListMap = jsonDecode(response.body);
    // }
    date =
        dataAsListMap[0]['date'].toString().isNotEmpty
            ? dataAsListMap[0]['date'].toString().substring(0, 10)
            : '';
    close = dataAsListMap[0]['close'].toString().split('.')[0];
    emit(state().copyWith(usdcop: usdcop));
    print('onLoadusdcop usdcop: ${state().usdcop?.close}');
  } catch (e) {
    print('Error llamando la tabla de USDCOP');
    emit(
      state().copyWith(
        errorCounter: state().errorCounter + 1,
        message:
            '🤕Error llamando📞 la tabla de USDCOP ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
      ),
    );
  }
}
