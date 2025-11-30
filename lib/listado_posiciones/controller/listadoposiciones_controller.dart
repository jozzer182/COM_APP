import 'dart:convert';

import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';
import '../model/listadoposiciones_fila.dart';
import '../model/listadoposiciones_model.dart';

class ListadoPosicionesController {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;

  ListadoPosicionesController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    ListadoPosiciones listadoPosiciones = ListadoPosiciones();
    List<ListadoPosicionesFila> list = [];
    try {
      Map<String, Object> dataSend = {
        'info': {'libro': 'BD_OE_SAP', 'hoja': 'LISTADO_POSICIONES'},
        'fname': "getHoja"
      };
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap.length > 0) {
        for (var item in dataAsListMap) {
          list.add(ListadoPosicionesFila.fromMap(item));
        }
      }
      listadoPosiciones.list = list;
      emit(state().copyWith(listadoPosiciones: listadoPosiciones));
    } catch (e) {
      bl.errorCarga("Listado Contratos", e);
    }
  }
}
