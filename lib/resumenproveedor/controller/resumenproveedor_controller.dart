import 'package:collection/collection.dart';
import 'package:com/resources/a_entero_2.dart';
import 'package:com/resumenproveedor/model/resumenproveedor_model.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../segodas/model/segoda_model.dart';

class ResProveedorController {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;
  late List<SegOda> segOdas;

  ResProveedorController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    segOdas = bl.state().segOdas!.segOdasList;
  }

  void crear() {
    try {
      ResumenProveedor resumenProveedor = ResumenProveedor();
      List<ResumenProveedorSingle> list = resumenProveedor.resumenproveedorList;
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
        ResumenProveedorSingle? resumen =
            list.firstWhereOrNull((e) => e.proveedor == segOda.proveedor);
        if (resumen == null) {
          list.add(
            ResumenProveedorSingle(
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
            ),
          );
          resumen =
              list.firstWhereOrNull((e) => e.proveedor == segOda.proveedor);
        }
        resumen!
            .setByMes(aEntero(segOda.mesequipo), aNum(segOda.valortotalcop));
      }
      resumenProveedor.resumenproveedorList =
          list.where((e) => e.total != 0).toList();

      // print('list: $list');
      emit(state().copyWith(resumenProveedor: resumenProveedor));
    } catch (e) {
      bl.errorCarga('Resumen Proveedor', e);
    }
  }
}
