import 'dart:convert';

import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';
import '../model/listadoodas_fila.dart';
import '../model/listadoodas_model.dart';

class ListadoOdasController {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;

  ListadoOdasController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    ListadoOdas listadoOdas = ListadoOdas();
    List<ListadoOdasFila> list = [];
    try {
      Map<String, Object> dataSend = {
        'info': {'libro': 'BD_OE_SAP', 'hoja': 'LISTADO_ODAS'},
        'fname': "getHoja"
      };
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap.length > 0) {
        for (var item in dataAsListMap) {
          if (item['fechapedido'].isNotEmpty) {
            list.add(ListadoOdasFila.fromMap(item));
          }
        }
      }
      listadoOdas.list = list;
      emit(state().copyWith(listadoOdas: listadoOdas));
    } catch (e) {
      bl.errorCarga("Listado Contratos", e);
    }
  }
}
