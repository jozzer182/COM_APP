import 'dart:convert';

import 'package:com/listado_contratos/model/listadocontrato.dart';
import 'package:com/listado_contratos/model/listadocontrato_fila.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';

class ListadoContratoController {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;

  ListadoContratoController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    ListadoContratos listadoContratos = ListadoContratos();
    List<ListadoContratosFila> list = [];
    try {
      Map<String, Object> dataSend = {
        'info': {'libro': 'BD_OE_SAP', 'hoja': 'LISTADO_CONTRATOS'},
        'fname': "getHoja"
      };
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap.length > 0) {
        for (var item in dataAsListMap) {
          list.add(ListadoContratosFila.fromMap(item));
        }
      }
      listadoContratos.list = list;
      emit(state().copyWith(listadoContratos: listadoContratos));
    } catch (e) {
      bl.errorCarga("Listado Contratos", e);
    }
  }
}
