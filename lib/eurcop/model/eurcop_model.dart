// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart';

import '../../resources/env_config.dart';

class Eurcop {
  String date = '';
  String close = '';

  Future obtener() async{
        Map<String, Object> dataSend = {
      "info": {"libro": "EURCOP", "hoja": "EURCOP"},
      "fname": "getHoja"
    };
    // print(jsonEncode(dataSend));
    Response response = await post(
      Uri.parse(EnvConfig.apiUsdCop),
      body: jsonEncode(dataSend),
    );
    // print('EurCOP response.body: ${response.body}');
    List dataAsListMap;
    if (response.statusCode == 302) {
      Response response2 =
          await get(Uri.parse(response.headers["location"] ?? ''));
      dataAsListMap = jsonDecode(response2.body);
    } else {
      dataAsListMap = jsonDecode(response.body);
    }
    date = dataAsListMap[0]['date'].toString().isNotEmpty
        ? dataAsListMap[0]['date'].toString().substring(0, 10)
        : '';
    close = dataAsListMap[0]['close'].toString().split('.')[0];
  }
}
