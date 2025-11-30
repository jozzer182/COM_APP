import 'dart:convert';

import 'package:com/segodas/model/segodas_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';
import '../model/segoda_enum.dart';
import '../model/segoda_model.dart';

class SegOdasController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;
  late SegOdas segOdas;

  SegOdasController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    segOdas = state().segOdas ?? SegOdas();
  }

  get obtener async {
    try {
      await segOdas.obtener();
      emit(state().copyWith(segOdas: segOdas));
    } catch (e) {
      bl.errorCarga('Odas', e);
    }
  }

  setList(List<SegOda> segOdasModified) {
    segOdas.segOdasListModified =
        segOdasModified.map((e) => e.copyWith()).toList();
    emit(state().copyWith(segOdas: segOdas));
  }

  modifyList({
    required CampoSegOda campo,
    required String valor,
    required String id,
  }) {
    SegOda segOda = segOdas.segOdasListModified.firstWhere((e) => e.id == id);
    segOda.asignar(campo: campo, valor: valor);
    emit(state().copyWith(segOdas: segOdas));
  }

  Future enviar({bool esNuevo = false}) async {
    List list = [];
    for (SegOda segOda in segOdas.segOdasListModified) {
      segOda.fechacambio = DateTime.now().toString();
      segOda.estado = 'OK';
      segOda.personacambio =
          FirebaseAuth.instance.currentUser?.email ?? "ErrorLeyendoUsuario";
      list.add(segOda.toMap());
    }
    Map dataSend = {};
    if (esNuevo) {
      dataSend = {
        'info': {'libro': "BD", 'listMap': list, 'hoja': 'reg'},
        'fname': "addListMapDB"
      };
    } else {
      dataSend = {
        'info': {'libro': "BD", 'listMap': list, 'hoja': 'reg'},
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
    }
    // print(response.body);
  }
}
