import 'dart:convert';

import 'package:com/preorden/model/list_model.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';
import '../model/doc_model.dart';
import '../model/reg_model.dart';

class PreordenListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  PreordenListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    PreordenList preordenList = PreordenList();
    try {
      Map<String, Object> dataSend = {
        'info': {'libro': 'PREORDENES', 'hoja': 'reg'},
        'fname': "getHoja"
      };
      // print("dataSend: $dataSend");
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap.length > 0) {
        for (var item in dataAsListMap) {
          preordenList.registros.add(PreordenReg.fromMap(item));
        }
      }

      //TODO crear los docs
      List<String> preordenes =
          preordenList.registros.map((e) => e.preorden).toSet().toList();

      for (String preorden in preordenes) {
        List<PreordenReg> doc = preordenList.registros
            .where((e) => e.preorden == preorden)
            .toList();
        preordenList.list.add(PreordenDoc()..list = doc);
      }

      // await segOdas.obtener();
      emit(state().copyWith(preordenList: preordenList));
    } catch (e) {
      bl.errorCarga('Preordenes', e);
    }
  }
}
