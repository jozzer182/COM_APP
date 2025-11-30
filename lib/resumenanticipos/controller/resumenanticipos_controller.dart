import 'package:collection/collection.dart';
import 'package:com/resources/a_entero_2.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../segodas/model/segoda_model.dart';
import '../model/resumenanticipos_model.dart';

class ResAnticiposController {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;
  late List<SegOda> segOdas;

  ResAnticiposController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    segOdas = bl.state().segOdas!.segOdasList;
  }

  void crear() {
    try {
      ResumenAnticipos resumenAnticipos = ResumenAnticipos();
      List<ResumenAnticiposSingle> list = resumenAnticipos.resumenAnticiposList;
      List<SegOda> segOdasFiltered = segOdas
          // .where((e) =>
          //     (e.observaciones1.toUpperCase().contains("PENDIENTE") &&
          //         !e.observaciones1.toUpperCase().contains("ORA")) ||
          //     e.observaciones1.toUpperCase().contains("PROVISION"))
          .where((e) => aNum(e.valoranticipo1) > 0)
          .toList();
      // print(
      //     'SEGODAS FILTERED: ${segOdasFiltered.map((e) => e.observaciones1).join(',')}');
      for (SegOda segOda in segOdasFiltered) {
        if (segOda.mesanticipos.isEmpty ||
            aEntero(segOda.mesanticipos) > 12 ||
            segOda.mesanticipos == '0') {
          continue;
        }
        ResumenAnticiposSingle? resumen = list.firstWhereOrNull((e) =>
            e.proyecto == segOda.proyecto && e.proveedor == segOda.proveedor);
        
        // Handle case when resumen is null by creating a new entry
        if (resumen == null) {
          resumen = ResumenAnticiposSingle(
            proyecto: segOda.proyecto,
            proveedor: segOda.proveedor,
            m01: 0,
            m02: 0,
            m03: 0,
            m04: 0,
            m05: 0,
            m06: 0,
            m07: 0,
            m08: 0,
            m09: 0,
            m10: 0,
            m11: 0,
            m12: 0,
          );
          list.add(resumen);
        }
        
        resumen.setByMes(
            aEntero(segOda.mesanticipos), aNum(segOda.valoranticipo1));
        resumen.setByMes(
            aEntero(segOda.mesanticipos) + 3, aNum(segOda.valoranticipo1) * -1);
      }
      resumenAnticipos.resumenAnticiposList =
          list.where((e) => e.totalAbs != 0).toList();
      // print('list: $list');
      emit(state().copyWith(resumenAnticipos: resumenAnticipos));
    } catch (e) {
      bl.errorCarga('Resumen Anticipos', e);
    }
  }
}
