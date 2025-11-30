import 'dart:convert';

import 'package:com/historico/model/historico_list_model.dart';
import 'package:com/historico/model/historico_reg_model.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';

class HistoricoListCtrl {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  HistoricoListCtrl(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    try {
      HistoricoList historicoList = HistoricoList();

      Map<String, Object> dataSend = {
        'info': {'libro': 'HISTORICO', 'hoja': '2024'},
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
          historicoList.list.add(HistoricoReg.fromMap(item));
        }
      }
      print('historicoList: ${historicoList.list.length}');
      emit(state().copyWith(historicoList: historicoList));
    } catch (e) {
      bl.errorCarga('HISTORICO', e);
    }
  }

  Future<List<Map<String, dynamic>>> obtenerMapYear(String year) async {
    try {
      // HistoricoList historicoList = HistoricoList();

      Map<String, Object> dataSend = {
        'info': {'libro': 'HISTORICO', 'hoja': year},
        'fname': "getHoja"
      };
      // print("dataSend: $dataSend");
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);

      // print(dataAsListMap.runtimeType);
      // if (dataAsListMap is List<Map<String, dynamic>>) {
      if (dataAsListMap is List) {
        return dataAsListMap.cast<Map<String, dynamic>>();
      }
    } catch (e) {
      bl.errorCarga('HISTORICO', e);
    }
    return [
      {'mensaje': 'No se han logrado cargar los datos'}
    ];
  }
}
