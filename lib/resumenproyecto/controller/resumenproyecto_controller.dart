import 'package:collection/collection.dart';
import 'package:com/resources/a_entero_2.dart';
import 'package:com/resumenproyecto/model/resumenproyecto_model.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../segodas/model/segoda_model.dart';

class ResProyectoController {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;
  late List<SegOda> segOdas;

  ResProyectoController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    segOdas = bl.state().segOdas!.segOdasList;
  }

  void crear() {
    try {
      ResumenProyecto resumenProyecto = ResumenProyecto();
      List<ResumenProyectoSingle> list = resumenProyecto.resumenproyectoList;
      List<SegOda> segOdasFiltered = segOdas
          .where(
            (e) => e.observaciones1.toUpperCase().contains("PENDIENTE") ||
                e.observaciones1.isEmpty,
          )
          .toList();
      for (SegOda segOda in segOdasFiltered) {
        if (segOda.mesequipo.isEmpty ||
            aEntero(segOda.mesequipo) > 12 ||
            segOda.mesequipo == '0') {
          continue;
        }
        ResumenProyectoSingle? resumen =
            list.firstWhereOrNull((e) => e.proyecto == segOda.proyecto);
        if (resumen == null) {
          list.add(
            ResumenProyectoSingle(
              proyecto: segOda.proyecto,
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
            ),
          );
          resumen = list.firstWhereOrNull((e) => e.proyecto == segOda.proyecto);
        }
        resumen!
            .setByMes(aEntero(segOda.mesequipo), aNum(segOda.valortotalcop));
      }
      resumenProyecto.resumenproyectoList =
          list.where((e) => e.total != 0).toList();
      emit(state().copyWith(resumenProyecto: resumenProyecto));
    } catch (e) {
      bl.errorCarga('Resumen Proyecto', e);
    }
  }
}
