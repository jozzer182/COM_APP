import 'dart:convert';

import 'package:com/preorden/controller/campo_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../preanalisis/model/reg_cupocontrato_model.dart';
import '../../preanalisis/model/reg_model.dart';
import '../../preanalisis/model/reg_proyecto.dart';
import '../../resources/constants/url.dart';
import '../../wbe/model/wbe_model.dart';
import '../model/doc_model.dart';
import '../model/reg_model.dart';
import 'email_controller.dart';

class PreordenDocController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  PreordenDocController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  CampoPreordenController get campo => CampoPreordenController(bl);

  EmailListController get email => EmailListController(bl);

  void get crear {
    PreordenDoc preordenDoc = PreordenDoc();
    List.generate(3, (index) {
      preordenDoc.list.add(PreordenReg.fromInit(index + 1));
    });

    for (PreordenReg preordenReg in preordenDoc.list) {
      preordenReg.fecha = DateTime.now().toString().substring(0, 10);
      preordenReg.estado = 'Pend_ODA_WBE';
    }
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void seleccionar(PreordenDoc preordenDoc) {
    emit(state().copyWith(preordenDoc: preordenDoc.copyWith()));
  }

  void crearPreAnalisis(
    List<PreanalisisProyectoReg> proyectoList,
    PreanalisisReg preanalisis,
    CupoContrato cupoContrato,
  ) {
    PreordenDoc preordenDoc = PreordenDoc();
    for (int i = 0; i < proyectoList.length; i++) {
      PreanalisisProyectoReg proyecto = proyectoList[i];
      PreordenReg preordenReg = PreordenReg.fromInit(i + 1);
      preordenReg.contrato = cupoContrato.contrato;
      preordenReg.e4e = preanalisis.e4e;
      preordenReg.descripcion = preanalisis.descripcion;
      preordenReg.um = proyecto.um;
      preordenReg.precio = cupoContrato.valorunitario.toString();
      preordenReg.moneda = cupoContrato.moneda;
      preordenReg.proyecto = proyecto.proyecto;
      preordenReg.pm = proyecto.pm.toUpperCase();
      preordenReg.portfolio = proyecto.portfolio;
      preordenReg.femid = proyecto.femid;
      preordenReg.femctd = proyecto.femctd;
      preordenReg.femfecha = proyecto.femfecha;
      preordenReg.femobservacion = proyecto.femobservacion;
      preordenReg.proyectowbe = proyecto.proyectowbe;
      preordenReg.ctd = proyecto.ctd;
      preordenReg.fecha = DateTime.now().toString().substring(0, 10);
      preordenReg.estado = 'Pend_ODA_WBE';
      if (proyecto.wbe.isNotEmpty || proyecto.wbe.length >= 24) {
        String wbe = proyecto.wbe;
        if (proyecto.wbe.length > 24) wbe = proyecto.wbe.substring(0, 24);
        preordenReg.wbe = wbe;
        WbeSingle wbeSingle = state().wbe!.wbeList.firstWhere(
              (element) => element.wbe == wbe,
              orElse: () => WbeSingle.fromZero(),
            );
        preordenReg.proyectowbe = wbeSingle.proyecto;
        preordenReg.status = wbeSingle.status;
        preordenReg.estado = 'Pend_ODA';
      }
      preordenDoc.list.add(preordenReg);
    }
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void get agregarFila {
    PreordenDoc preordenDoc = state().preordenDoc!;
    preordenDoc.list.add(PreordenReg.fromInit(preordenDoc.list.length + 1));
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void get quitarFila {
    PreordenDoc preordenDoc = state().preordenDoc!;
    if (preordenDoc.list.length > 1) {
      preordenDoc.list.removeLast();
      emit(state().copyWith(preordenDoc: preordenDoc));
    }
  }

  void quitarFilaEspecifica(int index) {
    PreordenDoc preordenDoc = state().preordenDoc!;
    preordenDoc.list.removeAt(index);
    for (int i = 0; i < preordenDoc.list.length; i++) {
      preordenDoc.list[i].pos = '${i + 1}';
    }
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void actualizarWBEs(List<String> ids) async {
    bl.startLoading;
    try {
      Map dataSend = {
        'info': {
          'ids': ids,
        },
        'fname': "getWbes"
      };
      print('${jsonEncode(dataSend)}');
      Response response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var respuesta = jsonDecode(response.body) ?? ['error', 'error'];
      if (respuesta.length > 0) {
        PreordenDoc preordenDoc = state().preordenDoc!;
        for (var item in respuesta) {
          PreordenReg preordenReg = preordenDoc.list.firstWhere(
            (element) => element.femid == item['id'].toString(),
            orElse: () => PreordenReg.fromInit(0),
          );
          if (item['wbe'].isNotEmpty || item['wbe'].length >= 24) {
            String wbe = item['wbe'];
            if (item['wbe'].length > 24) wbe = item['wbe'].substring(0, 24);
            preordenReg.wbe = wbe;
            WbeSingle wbeSingle = state().wbe!.wbeList.firstWhere(
                  (element) => element.wbe == wbe,
                  orElse: () => WbeSingle.fromZero(),
                );
            preordenReg.proyectowbe = wbeSingle.proyecto;
            preordenReg.status = wbeSingle.status;
            bool odaVacia = preordenReg.oda.isEmpty;
            preordenReg.estado = 'Completa';
            if (odaVacia) preordenReg.estado = 'Pend_ODA';
            emit(state().copyWith(preordenDoc: preordenDoc));
          }
        }
      }
    } catch (e) {
      bl.errorCarga('Actualizar WBE', e);
    }
    bl.stopLoading;
  }

  get guardar async {
    bl.startLoading;
    bl.mensajeFlotante(
        message:
            'Guardando Preorden.. por favor espere que se recarge la aplciación.');
    try {
      PreordenDoc preordenDoc = state().preordenDoc!;
      List<PreordenReg> list = preordenDoc.list;
      for (var reg in list) {
        reg.persona =
            FirebaseAuth.instance.currentUser?.email ?? "ErrorLeyendoUsuario";
        reg.fecha = DateTime.now().toString();
      }
      Map dataSend = {
        'info': {
          'libro': 'PREORDENES',
          'hoja': 'reg',
          'listMap': list.map((e) => e.toMap()).toList(),
        },
        'fname': "addPreorden"
      };
      // print('${jsonEncode(dataSend)}');
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      bl.mensajeFlotante(message: dataAsListMap.toString());
      add(Load());
    } catch (e) {
      bl.errorCarga('Guardar Preorden', e);
    }
    bl.stopLoading;
  }

  void agregarRazon(String value) {
    PreordenDoc preordenDoc = state().preordenDoc!;
    preordenDoc.razon = value;
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void get aplicarRazon {
    PreordenDoc preordenDoc = state().preordenDoc!;
    List<PreordenReg> list = preordenDoc.list;
    String persona =
        FirebaseAuth.instance.currentUser?.email ?? "ErrorLeyendoUsuario";
    String fecha = DateTime.now().toString();
    for (var reg in list) {
      if (reg.creadocomentario.isEmpty) {
        reg.creadopersona = persona;
        reg.creadofecha = fecha;
        reg.creadocomentario = preordenDoc.razon;
        continue;
      }
      if (reg.confirmadocomentario.isEmpty) {
        reg.confirmadopersona = persona;
        reg.confirmadofecha = fecha;
        reg.confirmadocomentario = preordenDoc.razon;
        continue;
      }
      if (reg.generadocomentario.isEmpty) {
        reg.generadopersona = persona;
        reg.generadofecha = fecha;
        reg.generadocomentario = preordenDoc.razon;
        continue;
      }
      reg.odapersona = persona;
      reg.odafecha = fecha;
      reg.odacomentario = preordenDoc.razon;
    }
    emit(state().copyWith(preordenDoc: preordenDoc));
  }
}
