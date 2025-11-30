import 'dart:convert';

import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';
import '../model/doc_model.dart';

class EmailListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;
  late PreordenDoc preordenDoc;

  EmailListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    preordenDoc = bl.state().preordenDoc!;
  }

  void get initDestinatariosPM {
    preordenDoc.destinatarios.clear();
    preordenDoc.destinatarios = [];
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    preordenDoc.destinatarios =
        preordenDoc.list.map((e) => e.pm.toUpperCase()).toSet().toList();
    preordenDoc.destinatarios
        .removeWhere((element) => !regex.hasMatch(element));
    preordenDoc.destinatarios.sort();
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void get initDestinatariosGestor {
    preordenDoc.destinatarios.clear();
    preordenDoc.destinatarios = [];
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    preordenDoc.destinatarios =
        preordenDoc.list.map((e) => e.gestor.toUpperCase()).toSet().toList();
    preordenDoc.destinatarios
        .removeWhere((element) => !regex.hasMatch(element));
    preordenDoc.destinatarios.sort();
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void get initConCopia {
    String email = state().user!.correo.toUpperCase();
    preordenDoc.conCopia = [email];
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void agregarDestinatarios(String value) {
    preordenDoc.destinatarios.add(value);
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void agregarConCopia(String value) {
    preordenDoc.conCopia.add(value);
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void quitarDestinatarios(String value) {
    preordenDoc.destinatarios.remove(value);
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void quitarConCopia(String value) {
    preordenDoc.conCopia.remove(value);
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  void agregarNota(String value) {
    PreordenDoc preordenDoc = state().preordenDoc!;
    preordenDoc.nota = value;
    emit(state().copyWith(preordenDoc: preordenDoc));
  }

  get enviarPM async {
    bl.startLoading;
    try {
      String remitente = state().user!.correo.toUpperCase();
      Map<String, Object> dataSend = {
        'info': {
          'datos': preordenDoc.list.map((e) => e.toMap()).toList(),
          'preorden': preordenDoc.list.first.preorden,
          'remitente': remitente,
          'e4e': preordenDoc.list.first.e4e,
          'descripcion': preordenDoc.list.first.descripcion,
          'destinatarios': preordenDoc.destinatarios,
          'cc': preordenDoc.conCopia,
          'nota': preordenDoc.nota,
        },
        'fname': "sendMailPM"
      };
      // print("dataSend: ${jsonEncode(dataSend)}");
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      bl.mensajeFlotante(message: dataAsListMap.toString());
      add(Load());
    } catch (e) {
      bl.errorCarga('Enviar Mail PM', e);
    }
    bl.stopLoading;
  }

  get enviarGestor async {
    bl.startLoading;
    try {
      String remitente = state().user!.correo.toUpperCase();
      Map<String, Object> dataSend = {
        'info': {
          'datos': preordenDoc.list.map((e) => e.toMap()).toList(),
          'preorden': preordenDoc.list.first.preorden,
          'remitente': remitente,
          'e4e': preordenDoc.list.first.e4e,
          'descripcion': preordenDoc.list.first.descripcion,
          'destinatarios': preordenDoc.destinatarios,
          'cc': preordenDoc.conCopia,
          'nota': preordenDoc.nota,
        },
        'fname': "sendMailGestor"
      };
      // print("dataSend: ${jsonEncode(dataSend)}");
      final response = await post(
        Uri.parse(ApiUrl.com),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      bl.mensajeFlotante(message: dataAsListMap.toString());
      add(Load());
    } catch (e) {
      bl.errorCarga('Enviar Mail PM', e);
    }
    bl.stopLoading;
  }
}
