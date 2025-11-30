import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:com/contrato/model/contratos_model.dart';
import 'package:com/segodas/controller/segoda_campo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../listado_odas/model/listadoodas_fila.dart';
import '../../oe/model/oe_model.dart';
import '../../resources/constants/url.dart';
import '../model/segoda_enum.dart';
import '../model/segoda_model.dart';

class SegOdaController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  SegOdaController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  void nuevo(OeSingle? oe) {
    SegOda segOda = SegOda.nuevo();
    if (oe != null) {
      segOda.documentocompras = oe.po;
      segOda.proveedor = oe.proovedor;
      segOda.posicion = oe.pos;
      segOda.gestor = oe.usuario;
      segOda.material = oe.e4e;
      segOda.puerto = oe.destino;
      segOda.textobreve = oe.descripcion;
      segOda.cantidaddepedido = oe.ctd;
      segOda.textobreve = oe.descripcion;
      segOda.incoterm = oe.incoterm;
      segOda.fechaentregaincotermactualizada = oe.fecha;
      segOda.fechadeentregaincoterm = oe.fechaincoterm;
      segOda.fechadocumento = oe.fechadocumento;
      segOda.contrato = oe.contrato;
      segOda.moneda = oe.moneda;
      segOda.precioneto = oe.precioneto;
      segOda.factorivanac = oe.moneda != 'COP' ? '40' : '19';
      segOda.tasa = '1';
      if (oe.moneda == 'USD') segOda.tasa = state().usdcop?.close?? '4200';
      if (oe.moneda == 'EUR') segOda.tasa = state().eurcop!.close;
      ContratoSingle? contrato = state()
          .contrato
          ?.contratoList
          .firstWhereOrNull(
              (e) => e.documentocompras == oe.contrato && e.material == oe.e4e);
      if (contrato != null) {
        // segOda.tiemposdetcadias = contrato.tiempocontractualdetcadias;
        // segOda.tiemposdeentregadias =
        //     contrato.tiempocontractualdeprimeranetregadias;
      }
    }
    try {
      emit(state().copyWith(segOda: segOda));
      if (oe != null) {
        campo.cambiar(campo: CampoSegOda.precioneto, valor: oe.precioneto);
        if (oe.moneda != 'COP') {
          segOda.valoranticipo1 = segOda.ivagastosnacionalizacion;
        }
      }
    } catch (e) {
      bl.errorCarga('creando la vista de ODA', e);
    }
  }

  void nuevoOdaList(ListadoOdasFila? oe) {
    SegOda segOda = SegOda.nuevo();
    if (oe != null) {
      segOda.documentocompras = oe.oda.toString();
      segOda.proveedor = oe.proveedor;
      segOda.posicion = oe.pos.toString();
      segOda.gestor = oe.usuario;
      segOda.material = oe.e4e;
      segOda.puerto = oe.destino;
      segOda.textobreve = oe.descripcion;
      segOda.cantidaddepedido = oe.ctd.toString();
      segOda.textobreve = oe.descripcion;
      segOda.incoterm = oe.inco;
      segOda.fechaentregaincotermactualizada = oe.fechaentrega.toString();
      segOda.fechadeentregaincoterm = oe.fechaentrega.toString();
      segOda.fechadocumento = oe.fechapedido.toString();
      segOda.contrato = oe.contrato;
      segOda.moneda = oe.moneda;
      segOda.precioneto = oe.precioneto.toString();
      segOda.factorivanac = oe.moneda != 'COP' ? '35' : '19';
      segOda.tasa = '1';
      if (oe.moneda == 'USD') segOda.tasa = state().usdcop?.close?? '4200';
      if (oe.moneda == 'EUR') segOda.tasa = state().eurcop!.close;
      ContratoSingle? contrato = state()
          .contrato
          ?.contratoList
          .firstWhereOrNull(
              (e) => e.documentocompras == oe.contrato && e.material == oe.e4e);
      if (contrato != null) {
        // segOda.tiemposdetcadias = contrato.tiempocontractualdetcadias;
        // segOda.tiemposdeentregadias =
        //     contrato.tiempocontractualdeprimeranetregadias;
      }
    }
    try {
      emit(state().copyWith(segOda: segOda));
      if (oe != null) {
        campo.cambiar(
            campo: CampoSegOda.precioneto, valor: oe.precioneto.toString());
      }
    } catch (e) {
      bl.errorCarga('creando la vista de LISTA ODA', e);
    }
  }

  void seleccionar(SegOda segOda) {
    emit(state().copyWith(segOda: segOda.copyWith()));
  }

  CampoController get campo => CampoController(bl);

  List<String> validar() {
    SegOda segOda = state().segOda!;
    return segOda.errores;
  }

  void guardar(bool esNuevo) async {
    SegOda segOda = state().segOda!;
    segOda.fechacambio = DateTime.now().toString();
    segOda.estado = 'OK';
    segOda.personacambio =
        FirebaseAuth.instance.currentUser?.email ?? "ErrorLeyendoUsuario";
    print('esNuevo: $esNuevo');
    Map dataSend = {};
    if (esNuevo) {
      dataSend = {
        'info': {
          'libro': "BD",
          'listMap': [segOda.toMap()],
          'hoja': 'reg'
        },
        'fname': "addListMapDB"
      };
    } else {
      dataSend = {
        'info': {
          'libro': "BD",
          'listMap': [segOda.toMap()],
          'hoja': 'reg'
        },
        'fname': "updateListMapDB"
      };
    }
    print('${jsonEncode(dataSend)}');
    bl.reset;
    bl.startLoading;

    try {
      Response response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var respuesta = jsonDecode(response.body) ?? ['error', 'error'];
      // print('respuesta : $respuesta');
      add(Load());
      await Future.delayed(const Duration(seconds: 1));
      bl.mensajeFlotante(message: respuesta.toString());
    } catch (e) {
      bl.errorCarga('Enviar SegOda', e);
      bl.stopLoading;
      await Future.delayed(const Duration(seconds: 4));
      add(Load());
    }
  }

  void borrar(bool esNuevo) async {
    if (esNuevo) {
      bl.mensajeFlotante(message: 'No se puede borrar un registro nuevo');
      return;
    }
    SegOda segOda = state().segOda!;
    Map dataSend = {
      'info': {
        'libro': "BD",
        'listMap': [segOda.toMapInt()],
        'hoja': 'reg'
      },
      'fname': "deleteById"
    };
    bl.reset;
    bl.startLoading;

    try {
      Response response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var respuesta = jsonDecode(response.body) ?? ['error', 'error'];
      // print('respuesta : $respuesta');
      add(Load());
      await Future.delayed(const Duration(seconds: 1));
      bl.mensajeFlotante(message: respuesta.toString());
    } catch (e) {
      bl.errorCarga('Borrar SegOda', e);
      bl.stopLoading;
      await Future.delayed(const Duration(seconds: 4));
      add(Load());
    }
  }
}
