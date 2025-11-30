import 'dart:convert';

import 'package:com/contrato/model/contrato_enum.dart';
import 'package:http/http.dart';

import '../../resources/constants/url.dart';
import '../../user/model/user_model.dart';
import 'contratos_model.dart';

class ContratoPlanilla {
  List<ContratoSingle> contratoSingleList;
  List<ContratoSingle> contratoSingleListEdit = [];
  ContratoPlanilla({
    required this.contratoSingleList,
  }) : contratoSingleListEdit =
            contratoSingleList.map((e) => e.copyWith()).toList() {
    for (ContratoSingle element in contratoSingleListEdit) {
      element.item = contratoSingleListEdit.indexOf(element) + 1;
    }
    for (ContratoSingle element in contratoSingleList) {
      element.item = contratoSingleList.indexOf(element) + 1;
    }
  }

  factory ContratoPlanilla.fromInit() {
    return ContratoPlanilla(
      contratoSingleList: List.generate(
        1,
        (i) => ContratoSingle.fromInit(i + 1),
      ),
    );
  }

  get agregar {
    contratoSingleListEdit.add(ContratoSingle.fromInit(
        contratoSingleListEdit.length + 1,
        contratoSingleListEdit[0].documentocompras));
  }

  get eliminar {
    if (contratoSingleList.length < contratoSingleListEdit.length) {
      contratoSingleListEdit.removeLast();
    }
  }

  get reset {
    contratoSingleListEdit =
        contratoSingleList.map((e) => e.copyWith()).toList();
    for (ContratoSingle element in contratoSingleListEdit) {
      element.item = contratoSingleListEdit.indexOf(element) + 1;
    }
  }

  modifyList(int ctd, String method) {
    switch (method) {
      case 'agregar':
        agregar;
        break;
      case 'eliminar':
        eliminar;
        break;
      case 'reset':
        reset;
        break;
      case 'resize':
        if (ctd > contratoSingleList.length) {
          contratoSingleListEdit.clear();
          contratoSingleListEdit.length = 0;
          contratoSingleListEdit = contratoSingleList
              .map((e) => e.copyWith())
              .toList(growable: true);
          for (ContratoSingle element in contratoSingleListEdit) {
            element.item = contratoSingleListEdit.indexOf(element) + 1;
          }
          for (var i = 0; i < ctd - contratoSingleList.length; i++) {
            agregar;
          }
        }
        break;
      default:
        break;
    }
  }

  asignar({
    required CampoContratoPlanilla campo,
    required String valor,
    required int item,
  }) {
    if (item == -1) {
      for (ContratoSingle element in contratoSingleListEdit) {
        if (campo == CampoContratoPlanilla.documentocompras) {
          element.documentocompras = valor;
        }
        if (campo == CampoContratoPlanilla.material) {
          element.material = valor;
        }
        if (campo ==
            CampoContratoPlanilla.tiempocontractualdeprimeranetregadias) {
          element.tiempocontractualdeprimeranetregadias = valor;
        }
        if (campo == CampoContratoPlanilla.tiempocontractualdetcadias) {
          element.tiempocontractualdetcadias = valor;
        }
        if (campo == CampoContratoPlanilla.tipotcacontractual) {
          element.tipotcacontractual = valor;
        }
        if (campo == CampoContratoPlanilla.etcontrato) {
          element.etcontrato = valor;
        }
        if (campo == CampoContratoPlanilla.versionetcontrato) {
          element.versionetcontrato = valor;
        }
        if (campo == CampoContratoPlanilla.tendercode) {
          element.tendercode = valor;
        }
        if (campo == CampoContratoPlanilla.tiepogarantiameses) {
          element.tiepogarantiameses = valor;
        }
        if (campo == CampoContratoPlanilla.estado) {
          element.estado = valor;
        }
        if (campo == CampoContratoPlanilla.persona) {
          element.persona = valor;
        }
        if (campo == CampoContratoPlanilla.fecha) {
          element.fecha = valor;
        }
      }
    } else {
      if (campo == CampoContratoPlanilla.documentocompras) {
        contratoSingleListEdit[item].documentocompras = valor;
      }
      if (campo == CampoContratoPlanilla.material) {
        contratoSingleListEdit[item].material = valor;
      }
      if (campo ==
          CampoContratoPlanilla.tiempocontractualdeprimeranetregadias) {
        contratoSingleListEdit[item].tiempocontractualdeprimeranetregadias =
            valor;
      }
      if (campo == CampoContratoPlanilla.tiempocontractualdetcadias) {
        contratoSingleListEdit[item].tiempocontractualdetcadias = valor;
      }
      if (campo == CampoContratoPlanilla.tipotcacontractual) {
        contratoSingleListEdit[item].tipotcacontractual = valor;
      }
      if (campo == CampoContratoPlanilla.etcontrato) {
        contratoSingleListEdit[item].etcontrato = valor;
      }
      if (campo == CampoContratoPlanilla.versionetcontrato) {
        contratoSingleListEdit[item].versionetcontrato = valor;
      }
      if (campo == CampoContratoPlanilla.tendercode) {
        contratoSingleListEdit[item].tendercode = valor;
      }
      if (campo == CampoContratoPlanilla.tiepogarantiameses) {
        contratoSingleListEdit[item].tiepogarantiameses = valor;
      }
      if (campo == CampoContratoPlanilla.estado) {
        contratoSingleListEdit[item].estado = valor;
      }
      if (campo == CampoContratoPlanilla.persona) {
        contratoSingleListEdit[item].persona = valor;
      }
      if (campo == CampoContratoPlanilla.fecha) {
        contratoSingleListEdit[item].fecha = valor;
      }
    }
  }

  List? validar({
    required Contrato contrato,
    required bool esNuevo,
  }) {
    var faltantes = [];
    //que no se repita el documento de compras
    if (esNuevo &&
        contrato.contratoList.any((e) =>
            e.documentocompras == contratoSingleListEdit[0].documentocompras)) {
      faltantes.add(
          'El documento de compras ${contratoSingleListEdit[0].documentocompras} ya existe');
    }
    if (contratoSingleListEdit[0].documentocompras == '') {
      faltantes.add('CONTRATO');
    }
    //que en el contrato no se repita el material
    Map uniqueE4e = {};
    for (ContratoSingle reg in contratoSingleListEdit) {
      String f = 'Item: ${reg.item} =>';
      if (reg.material.isEmpty) f += ' E4e,';
      if (reg.tiempocontractualdetcadias.isEmpty)
        f += 'Tiempo Contractual de TCA';
      if (f != 'Item: ${reg.item} =>') faltantes.add(f);
      if (uniqueE4e.containsKey(reg.material)) {
        uniqueE4e[reg.material] = uniqueE4e[reg.material] + 1;
      } else {
        uniqueE4e[reg.material] = 1;
      }
    }
    for (var key in uniqueE4e.keys) {
      if (uniqueE4e[key]! > 1) {
        faltantes.add('E4E $key se repite');
      }
    }
    if (faltantes.isNotEmpty) {
      faltantes.insert(0,
          'Por favor revise los siguientes campos en la planilla, para poder realizar el guardado:');
      return faltantes;
    } else {
      return null;
    }
  }

  Future<String?> enviar({
    required User user,
    required bool esNuevo,
  }) async {
    List list = [];
    for (ContratoSingle row in contratoSingleListEdit) {
      row.estado = 'activo';
      row.persona = user.nombre;
      row.fecha = DateTime.now().toString();
      list.add({
        ...row.toMap(),
      });
    }
    Map dataSend = {};
    if (esNuevo) {
      dataSend = {
        'info': {'libro': "BD", 'listMap': list, 'hoja': 'contrato'},
        'fname': "addListMapDB"
      };
    } else {
      dataSend = {
        'info': {'libro': "BD", 'listMap': list, 'hoja': 'contrato'},
        'fname': "updateListMapDB"
      };
    }
    // print(jsonEncode(dataSend));

    var response =
        await post(Uri.parse(ApiUrl.com), body: jsonEncode(dataSend));
    // print(response.body);
    var respuesta = jsonDecode(response.body) ?? ['error', 'error'];
    // print(respuesta);
    if (respuesta is List) {
      respuesta =
          'Se han agregado ${respuesta[0]} registros con el pedido ${respuesta[1]}';
    } else {
      print(respuesta);
    }
    return respuesta;
  }

  Future<String?> anular({
    required User user,
  }) async {
    List list = [];
    for (ContratoSingle row in contratoSingleListEdit) {
      row.estado = 'anulado';
      row.persona = user.nombre;
      row.fecha = DateTime.now().toString();
      list.add({
        ...row.toMap(),
      });
    }
    Map dataSend = {
      'info': {'libro': "BD", 'listMap': list, 'hoja': 'contrato'},
      'fname': "updateListMapDB"
    };
    // print(jsonEncode(dataSend));

    var response =
        await post(Uri.parse(ApiUrl.com), body: jsonEncode(dataSend));
    // print(response.body);
    var respuesta = jsonDecode(response.body) ?? ['error', 'error'];
    // print(respuesta);
    if (respuesta is List) {
      respuesta =
          'Se han eliminado ${respuesta[0]} registros con el pedido ${respuesta[1]}';
    } else {
      print(respuesta);
    }
    return respuesta;
  }
}
