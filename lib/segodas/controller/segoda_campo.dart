import 'package:collection/collection.dart';
import 'package:com/resources/a_entero_2.dart';
import 'package:com/segodas/model/segoda_model.dart';
import 'package:flutter/material.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../contrato/model/contratos_model.dart';
import '../model/segoda_enum.dart';

class CampoController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  late SegOda segOda;

  CampoController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    segOda = bl.state().segOda!;
  }

  bool _reglasPre(
    CampoSegOda campo,
    String valor,
  ) {
    // if (campo == CampoSegOda.conformado) {
    //   if ((aNum(segOda.cantidaddepedido) - aNum(valor)) < 0) {
    //     bl.mensajeFlotante(
    //         message: 'Lo Conformado no puede ser superior al pedido');
    //     return false;
    //   }
    // }

    if (campo == CampoSegOda.moneda) {
      if (valor == 'EUR') segOda.tasa = state().eurcop?.close ?? '4611';
      if (valor == 'USD') segOda.tasa = state().usdcop?.close ?? '4200';
      if (valor == 'COP') segOda.tasa = '1';
    }

    if (campo == CampoSegOda.contrato || campo == CampoSegOda.material) {
      // ignore: unused_local_variable
      ContratoSingle? contrato = state()
          .contrato
          ?.contratoList
          .firstWhereOrNull(
            (e) => e.documentocompras == valor && e.material == segOda.material,
          );
      if (campo == CampoSegOda.material) {
        contrato = state().contrato?.contratoList.firstWhereOrNull((e) =>
            e.documentocompras == segOda.contrato && e.material == valor);
      }
      // if (contrato != null) {
      //   segOda.tiemposdetcadias = contrato.tiempocontractualdetcadias;
      //   segOda.tiemposdeentregadias =
      //       contrato.tiempocontractualdeprimeranetregadias;
      // }
    }

    return true;
  }

  void cambiar({
    required CampoSegOda campo,
    required String valor,
  }) {
    bool isOk = _reglasPre(campo, valor);
    if (isOk) {
      segOda.asignar(campo: campo, valor: valor);
      _reglasPos();
    }
    emit(state().copyWith(segOda: segOda));
  }

  void _reglasPos() {
    segOda.saldo = (aNum(segOda.cantidaddepedido))
        .toStringAsFixed(0);
    segOda.valornetodepedido =
        (aNum(segOda.cantidaddepedido) * aNum(segOda.precioneto))
            .toStringAsFixed(2);
    segOda.subtotalcop =
        (aNum(segOda.valornetodepedido) * aNum(segOda.tasa)).toStringAsFixed(2);
    segOda.ivagastosnacionalizacion =
        ((aNum(segOda.factorivanac) / 100) * aNum(segOda.subtotalcop))
            .toStringAsFixed(2);
    segOda.valortotalcop =
        (aNum(segOda.ivagastosnacionalizacion) + aNum(segOda.subtotalcop))
            .toStringAsFixed(2);
    segOda.saldopendiente =
        (aNum(segOda.valortotalcop) - aNum(segOda.vrpagado) - aNum(segOda.valoranticipo1)).toString();
    if (segOda.mesequipo.isEmpty) segOda.mesequipoColor = Colors.red;
    if (segOda.mesequipo.isNotEmpty) segOda.mesequipoColor = Colors.green;
    if (segOda.proyecto.isEmpty) segOda.proyectoColor = Colors.red;
    if (segOda.proyecto.isNotEmpty) segOda.proyectoColor = Colors.green;
    if (segOda.observaciones1.isEmpty) segOda.observaciones1Color = Colors.red;
    if (segOda.observaciones1.isNotEmpty) {
      segOda.observaciones1Color = Colors.green;
    }
  }
}
