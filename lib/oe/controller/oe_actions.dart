import 'dart:convert';

import 'package:com/listado_odas/model/listadoodas_fila.dart';
import 'package:com/resources/a_entero_2.dart';
import 'package:http/http.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../listado_odas/model/listadoodas_model.dart';
import '../../resources/constants/apis.dart';
import '../../resources/env_config.dart';
import '../model/oe_model.dart';

// onLoadOe(Bl bl) async {
//   var emit = bl.emit;
//   MainState Function() state = bl.state;
//   Oe oe = Oe();
//   try {
//     await oe.obtener();
//     emit(state().copyWith(oe: oe));
//   } catch (e) {
//     bl.errorCarga("Oe", e);
//   }
// }

fixPrecioneto(Bl bl) {
  var emit = bl.emit;
  MainState Function() state = bl.state;
  Oe oe = state().oe!;
  ListadoOdas listadoOdas = state().listadoOdas!;
  List<ListadoOdasFila> odas = listadoOdas.list;
  for (OeSingle oeSingle in oe.oeList) {
    ListadoOdasFila oda = odas.firstWhere(
      (element) =>
          element.oda.toString() == oeSingle.po &&
          element.pos.toString() == oeSingle.pos,
      orElse: () => ListadoOdasFila.fromInit(),
    );
    if (oda.cantidadbase != 0 && oda.cantidadbase != 1) {
      oeSingle.precioneto = (aNum(oeSingle.precioneto) / oda.cantidadbase).toString();
    }
  }
  emit(state().copyWith(oe: oe));
}


class OeController {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;

  OeController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    Oe oe = Oe();

    try {
      var dataAsListMap;

      // Primero intentar obtener datos de Supabase
      try {
        final supabaseClient = SupabaseClient(
          Api.femSamSupUrl,
          Api.femSamSupKey,
        );
        final response =
            await supabaseClient
                .from('oe') // Tabla para oe
                .select();

        if (response.isNotEmpty) {
          dataAsListMap = response;
          // print('tipo de datos OE: ${dataAsListMap.runtimeType}');
        } else {
          bl.mensaje(message: "Eror Oe desde Supabase");
          // Si no hay datos en Supabase, intentar con Google Script
          dataAsListMap = await _obtenerDesdeGoogleScript();
        }
      } catch (e) {
        bl.errorCarga("Oe desde Supabase", e);
        // Si hay error en Supabase, intentar con Google Script
        dataAsListMap = await _obtenerDesdeGoogleScript();
      }

      if (dataAsListMap == null ||
          dataAsListMap is! List ||
          dataAsListMap.isEmpty) {
        bl.mensaje(message: "Error Oe vacio");
        return;
      }

      // Procesar los datos
      for (var item in dataAsListMap) {
        oe.oeList.add(OeSingle.fromMap(item));
      }

      // Establecer lista de búsqueda
      oe.oeListSearch = [...oe.oeList];

      // Procesar la información de órdenes futuras para oeByE4e y e4eList como en el método original
      List<OeSingle> oeListSinceToday =
          oe.oeList
              .where(
                (e) =>
                    DateTime.parse(e.fecha).difference(DateTime.now()).inDays >=
                    0,
              )
              .toList();

      for (OeSingle reg in oeListSinceToday) {
        if (oe.oeByE4e['${reg.e4e}${DateTime.parse(reg.fecha).month}${DateTime.parse(reg.fecha).year}'] ==
            null) {
          oe.oeByE4e['${reg.e4e}${DateTime.parse(reg.fecha).month}${DateTime.parse(reg.fecha).year}'] =
              {'e4e': reg.e4e, 'ctd': 0.0};
        }
        oe.oeByE4e['${reg.e4e}${DateTime.parse(reg.fecha).month}${DateTime.parse(reg.fecha).year}']['ctd'] +=
            double.parse(reg.ctd);
      }

      for (var key in oe.oeByE4e.keys) {
        oe.e4eList.add(oe.oeByE4e[key]['e4e']);
      }
      oe.e4eList = oe.e4eList.toSet().toList();
      oe.e4eList.sort();

      emit(state().copyWith(oe: oe));
    } catch (e) {
      bl.errorCarga("Oe desde Google Script", e);
    }
  }

  // Método auxiliar para obtener datos desde Google Script
  Future<dynamic> _obtenerDesdeGoogleScript() async {
    var dataSend = {
      'dataReq': {'hoja': 'OE'},
      'fname': "getSAPList",
    };

    final response = await post(
      Uri.parse(EnvConfig.apiOeActions),
      body: jsonEncode(dataSend),
    );

    var dataAsListMap;
    if (response.statusCode == 302) {
      var response2 = await get(Uri.parse(response.headers["location"] ?? ''));
      dataAsListMap = jsonDecode(response2.body);
    } else {
      dataAsListMap = jsonDecode(response.body);
    }

    // Verificar si dataAsListMap contiene datos y quitar la primera fila si es cabecera
    if (dataAsListMap != null &&
        dataAsListMap is List &&
        dataAsListMap.isNotEmpty) {
      return dataAsListMap.sublist(1); // Quitar la primera fila (cabecera)
    }

    return dataAsListMap;
  }
}