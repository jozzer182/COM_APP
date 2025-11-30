import 'package:com/budget/model/budget_model.dart';
import 'package:com/preorden/model/doc_model.dart';
import 'package:com/preorden/model/reg_enum.dart';
import 'package:com/preorden/model/reg_model.dart';
import 'package:com/wbe/model/wbe_model.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../listado_contratos/model/listadocontrato_fila.dart';
import '../../listado_posiciones/model/listadoposiciones_fila.dart';

class CampoPreordenController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  late PreordenDoc preordenDoc;

  CampoPreordenController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    preordenDoc = bl.state().preordenDoc!;
  }

  bool _reglasPre(
    CampoPreorden campo,
    String valor,
    int index,
  ) {
    return true;
  }

  void cambiar({
    required CampoPreorden campo,
    required String valor,
    required int index,
  }) {
    bool isContrato = campo == CampoPreorden.contrato;
    bool isWbe = campo == CampoPreorden.wbe;
    bool isE4e = campo == CampoPreorden.e4e;
    if ((isContrato || isWbe || isE4e) && valor.contains('|')) {
      valor = valor.split(' |')[0];
    }
    bool isOk = _reglasPre(campo, valor, index);
    if (!isOk || index < -1) return;
    if (index == -1) {
      for (PreordenReg preordenReg in preordenDoc.list) {
        preordenReg.asignar(campo: campo, valor: valor);
      }
    } else {
      preordenDoc.list[index].asignar(campo: campo, valor: valor);
    }
    _reglasPos(campo, valor, index);
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void _reglasPos(
    CampoPreorden campo,
    String valor,
    int index,
  ) {
    index = index < 0 ? 0 : index;
    bool modE4e = preordenDoc.list[index].e4e.length == 6;
    bool modProyecto = preordenDoc.list[index].proyecto.isNotEmpty;
    bool modWbe = preordenDoc.list[index].wbe.length == 22;
    bool modOda = preordenDoc.list[index].oda.isNotEmpty;
    if (modProyecto) _modificarProyecto(index);
    if (modE4e) _modificarE4e(index);
    if (modWbe) _modificarWbe(index);
    if (modWbe && modOda) {
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.estado,
        valor: 'Completa',
      );
    }
    if (modWbe && !modOda) {
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.estado,
        valor: 'Pend_ODA',
      );
    }
    if (!modWbe && modOda) {
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.estado,
        valor: 'Pend_WBE',
      );
    }
    if (!modWbe && !modOda) {
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.estado,
        valor: 'Pend_ODA_WBE',
      );
    }
  }

  void _modificarProyecto(int index) {
    String portfolio = state()
        .budget!
        .budgetList
        .firstWhere(
          (element) => element.proyecto == preordenDoc.list[index].proyecto,
          orElse: () => BudgetSingle.fromInit(),
        )
        .ejecutor;
    if (portfolio.isNotEmpty) {
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.portfolio,
        valor: portfolio,
      );
    }
  }

  void _modificarE4e(int index) {
    String e4e = preordenDoc.list[index].e4e;
    ListadoPosicionesFila posicion = state().listadoPosiciones!.list.firstWhere(
          (element) => element.e4e == e4e,
          orElse: () => ListadoPosicionesFila.zero(),
        );
    if (posicion.descripcion.isNotEmpty) {
      String moneda = state()
          .listadoContratos!
          .list
          .firstWhere(
            (element) => element.contrato == posicion.contrato,
            orElse: () => ListadoContratosFila.zero(),
          )
          .moneda;
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.descripcion,
        valor: posicion.descripcion,
      );
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.precio,
        valor: posicion.precioneto.toString(),
      );
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.um,
        valor: posicion.um,
      );
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.moneda,
        valor: moneda,
      );
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.e4e,
        valor: e4e,
      );
    }
  }

  void _modificarWbe(int index) {
    String wbe = preordenDoc.list[index].wbe;
    WbeSingle wbeSingle = state().wbe!.wbeList.firstWhere(
          (element) => element.wbe == wbe,
          orElse: () => WbeSingle.fromZero(),
        );
    if (wbeSingle.wbe.isNotEmpty) {
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.proyectowbe,
        valor: wbeSingle.proyecto,
      );
      preordenDoc.list[index].asignar(
        campo: CampoPreorden.status,
        valor: wbeSingle.status,
      );
    }
  }
}
