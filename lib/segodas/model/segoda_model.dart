// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:com/segodas/model/segoda_enum.dart';

import '../../resources/a_entero_2.dart';
import '../../resources/toCurrency.dart';
import '../../resources/to_celda.dart';

class SegOda {
  String id;
  String contrato;
  String documentocompras;
  String fechadocumento;
  String proveedor;
  String proyecto;
  // String bdg2024;
  String posicion;
  String material;
  String textobreve;
  String unidadmedida;
  String cantidaddepedido;
  // String conformado;
  String saldo;
  String moneda;
  String precioneto;
  String valornetodepedido;
  String subtotalcop;
  String ivagastosnacionalizacion;
  String factorivanac;
  String valortotalcop;
  String vrpagado;
  String valoranticipo1;
  // String nopdp;
  String saldopendiente;
  String fechadeentregaincoterm;
  // String fechaconformidad;
  String mesequipo;
  String mesanticipos;
  String gestor;
  // String ou;
  // String familia;
  String incoterm;
  String puerto;
  // String wbe;
  String observaciones1;
  String observaciones2;
  // String fechafirmadelcontratodecontrato;
  // String fechafinalizacioncontrato;
  // String fechaactadeinicio;
  // String tiemposdetcadias;
  // String tiemposdeentregadias;
  // String fechaentregaoda;
  // String fechaaprobaciondisenos;
  // String hitodisenocumplido;
  // String retiesino;
  // String vigenciaretie;
  // String fechatcacontractual;
  // String fechaestimadatcacierremlm;
  // String hitotcacumplido;
  // String plandeproduccion;
  // String fechapruebasqmlm;
  // String hitopruebasqcumplido;
  // String rollingtenderdeclarado;
  // String rollingtenderno;
  // String tiempoestimadodetransporte;
  String fechaentregaincotermactualizada;
  // String hitocumplido;
  String fechacambio;
  String personacambio;
  String estado;
  String tasa;
  Color contratoColor = Colors.grey[300]!;
  Color documentocomprasColor = Colors.grey[300]!;
  Color fechadocumentoColor = Colors.grey[300]!;
  Color proveedorColor = Colors.grey[300]!;
  Color proyectoColor = Colors.grey[300]!;
  Color bdg2024Color = Colors.grey[300]!;
  Color posicionColor = Colors.grey[300]!;
  Color materialColor = Colors.grey[300]!;
  Color textobreveColor = Colors.grey[300]!;
  Color unidadmedidaColor = Colors.grey[300]!;
  Color cantidaddepedidoColor = Colors.grey[300]!;
  Color conformadoColor = Colors.grey[300]!;
  Color saldoColor = Colors.grey[300]!;
  Color monedaColor = Colors.grey[300]!;
  Color precionetoColor = Colors.grey[300]!;
  Color valornetodepedidoColor = Colors.grey[300]!;
  Color subtotalcopColor = Colors.grey[300]!;
  Color ivagastosnacionalizacionColor = Colors.grey[300]!;
  Color factorivanacColor = Colors.grey[300]!;
  Color valortotalcopColor = Colors.grey[300]!;
  Color vrpagadoColor = Colors.grey[300]!;
  Color valoranticipo1Color = Colors.grey[300]!;
  Color nopdpColor = Colors.grey[300]!;
  Color saldopendienteColor = Colors.grey[300]!;
  Color fechadeentregaincotermColor = Colors.grey[300]!;
  Color fechaconformidadColor = Colors.grey[300]!;
  Color mesequipoColor = Colors.grey[300]!;
  Color mesanticiposColor = Colors.grey[300]!;
  Color gestorColor = Colors.grey[300]!;
  Color ouColor = Colors.grey[300]!;
  Color familiaColor = Colors.grey[300]!;
  Color incotermColor = Colors.grey[300]!;
  Color puertoColor = Colors.grey[300]!;
  Color wbeColor = Colors.grey[300]!;
  Color observaciones1Color = Colors.grey[300]!;
  Color observaciones2Color = Colors.grey[300]!;
  Color fechafirmadelcontratodecontratoColor = Colors.grey[300]!;
  Color fechafinalizacioncontratoColor = Colors.grey[300]!;
  Color fechaactadeinicioColor = Colors.grey[300]!;
  Color tiemposdetcadiasColor = Colors.grey[300]!;
  Color tiemposdeentregadiasColor = Colors.grey[300]!;
  Color fechaentregaodaColor = Colors.grey[300]!;
  Color fechaaprobaciondisenosColor = Colors.grey[300]!;
  Color hitodisenocumplidoColor = Colors.grey[300]!;
  Color retiesinoColor = Colors.grey[300]!;
  Color vigenciaretieColor = Colors.grey[300]!;
  Color fechatcacontractualColor = Colors.grey[300]!;
  Color fechaestimadatcacierremlmColor = Colors.grey[300]!;
  Color hitotcacumplidoColor = Colors.grey[300]!;
  Color plandeproduccionColor = Colors.grey[300]!;
  Color fechapruebasqmlmColor = Colors.grey[300]!;
  Color hitopruebasqcumplidoColor = Colors.grey[300]!;
  Color rollingtenderdeclaradoColor = Colors.grey[300]!;
  Color rollingtendernoColor = Colors.grey[300]!;
  Color tiempoestimadodetransporteColor = Colors.grey[300]!;
  Color fechaentregaincotermactualizadaColor = Colors.grey[300]!;
  Color hitocumplidoColor = Colors.grey[300]!;
  Color tasaColor = Colors.grey[300]!;
  num? diasDiseno = 0;
  num? diasTca = 0;
  num? diasPruebas = 0;
  num? diasEntrega = 0;
  SegOda({
    required this.id,
    required this.contrato,
    required this.documentocompras,
    required this.fechadocumento,
    required this.proveedor,
    required this.proyecto,
    // required this.bdg2024,
    required this.posicion,
    required this.material,
    required this.textobreve,
    required this.unidadmedida,
    required this.cantidaddepedido,
    // required this.conformado,
    required this.saldo,
    required this.moneda,
    required this.precioneto,
    required this.valornetodepedido,
    required this.subtotalcop,
    required this.ivagastosnacionalizacion,
    required this.factorivanac,
    required this.valortotalcop,
    required this.vrpagado,
    required this.valoranticipo1,
    // required this.nopdp,
    required this.saldopendiente,
    required this.fechadeentregaincoterm,
    // required this.fechaconformidad,
    required this.mesequipo,
    required this.mesanticipos,
    required this.gestor,
    // required this.ou,
    // required this.familia,
    required this.incoterm,
    required this.puerto,
    // required this.wbe,
    required this.observaciones1,
    required this.observaciones2,
    // required this.fechafirmadelcontratodecontrato,
    // required this.fechafinalizacioncontrato,
    // required this.fechaactadeinicio,
    // required this.tiemposdetcadias,
    // required this.tiemposdeentregadias,
    // required this.fechaentregaoda,
    // required this.fechaaprobaciondisenos,
    // required this.hitodisenocumplido,
    // required this.retiesino,
    // required this.vigenciaretie,
    // required this.fechatcacontractual,
    // required this.fechaestimadatcacierremlm,
    // required this.hitotcacumplido,
    // required this.plandeproduccion,
    // required this.fechapruebasqmlm,
    // required this.hitopruebasqcumplido,
    // required this.rollingtenderdeclarado,
    // required this.rollingtenderno,
    // required this.tiempoestimadodetransporte,
    required this.fechaentregaincotermactualizada,
    // required this.hitocumplido,
    required this.fechacambio,
    required this.personacambio,
    required this.estado,
    required this.tasa,
  });

  SegOda copyWith({
    String? id,
    String? contrato,
    String? documentocompras,
    String? fechadocumento,
    String? proveedor,
    String? proyecto,
    String? bdg2024,
    String? posicion,
    String? material,
    String? textobreve,
    String? unidadmedida,
    String? cantidaddepedido,
    String? conformado,
    String? saldo,
    String? moneda,
    String? precioneto,
    String? valornetodepedido,
    String? subtotalcop,
    String? ivagastosnacionalizacion,
    String? factorivanac,
    String? valortotalcop,
    String? vrpagado,
    String? valoranticipo1,
    String? nopdp,
    String? saldopendiente,
    String? fechadeentregaincoterm,
    String? fechaconformidad,
    String? mesequipo,
    String? mesanticipos,
    String? gestor,
    String? ou,
    String? familia,
    String? incoterm,
    String? puerto,
    String? wbe,
    String? observaciones1,
    String? observaciones2,
    String? fechafirmadelcontratodecontrato,
    String? fechafinalizacioncontrato,
    String? fechaactadeinicio,
    String? tiemposdetcadias,
    String? tiemposdeentregadias,
    String? fechaentregaoda,
    String? fechaaprobaciondisenos,
    String? hitodisenocumplido,
    String? retiesino,
    String? vigenciaretie,
    String? fechatcacontractual,
    String? fechaestimadatcacierremlm,
    String? hitotcacumplido,
    String? plandeproduccion,
    String? fechapruebasqmlm,
    String? hitopruebasqcumplido,
    String? rollingtenderdeclarado,
    String? rollingtenderno,
    String? tiempoestimadodetransporte,
    String? fechaentregaincotermactualizada,
    String? hitocumplido,
    String? fechacambio,
    String? personacambio,
    String? estado,
    String? tasa,
  }) {
    return SegOda(
      id: id ?? this.id,
      contrato: contrato ?? this.contrato,
      documentocompras: documentocompras ?? this.documentocompras,
      fechadocumento: fechadocumento ?? this.fechadocumento,
      proveedor: proveedor ?? this.proveedor,
      proyecto: proyecto ?? this.proyecto,
      // bdg2024: bdg2024 ?? this.bdg2024,
      posicion: posicion ?? this.posicion,
      material: material ?? this.material,
      textobreve: textobreve ?? this.textobreve,
      unidadmedida: unidadmedida ?? this.unidadmedida,
      cantidaddepedido: cantidaddepedido ?? this.cantidaddepedido,
      // conformado: conformado ?? this.conformado,
      saldo: saldo ?? this.saldo,
      moneda: moneda ?? this.moneda,
      precioneto: precioneto ?? this.precioneto,
      valornetodepedido: valornetodepedido ?? this.valornetodepedido,
      subtotalcop: subtotalcop ?? this.subtotalcop,
      ivagastosnacionalizacion:
          ivagastosnacionalizacion ?? this.ivagastosnacionalizacion,
      factorivanac: factorivanac ?? this.factorivanac,
      valortotalcop: valortotalcop ?? this.valortotalcop,
      vrpagado: vrpagado ?? this.vrpagado,
      valoranticipo1: valoranticipo1 ?? this.valoranticipo1,
      // nopdp: nopdp ?? this.nopdp,
      saldopendiente: saldopendiente ?? this.saldopendiente,
      fechadeentregaincoterm:
          fechadeentregaincoterm ?? this.fechadeentregaincoterm,
      // fechaconformidad: fechaconformidad ?? this.fechaconformidad,
      mesequipo: mesequipo ?? this.mesequipo,
      mesanticipos: mesanticipos ?? this.mesanticipos,
      gestor: gestor ?? this.gestor,
      // ou: ou ?? this.ou,
      // familia: familia ?? this.familia,
      incoterm: incoterm ?? this.incoterm,
      puerto: puerto ?? this.puerto,
      // wbe: wbe ?? this.wbe,
      observaciones1: observaciones1 ?? this.observaciones1,
      observaciones2: observaciones2 ?? this.observaciones2,
      // fechafirmadelcontratodecontrato: fechafirmadelcontratodecontrato ??
      // this.fechafirmadelcontratodecontrato,
      // fechafinalizacioncontrato:
      // fechafinalizacioncontrato ?? this.fechafinalizacioncontrato,
      // fechaactadeinicio: fechaactadeinicio ?? this.fechaactadeinicio,
      // tiemposdetcadias: tiemposdetcadias ?? this.tiemposdetcadias,
      // tiemposdeentregadias: tiemposdeentregadias ?? this.tiemposdeentregadias,
      // fechaentregaoda: fechaentregaoda ?? this.fechaentregaoda,
      // fechaaprobaciondisenos:
      // fechaaprobaciondisenos ?? this.fechaaprobaciondisenos,
      // hitodisenocumplido: hitodisenocumplido ?? this.hitodisenocumplido,
      // retiesino: retiesino ?? this.retiesino,
      // vigenciaretie: vigenciaretie ?? this.vigenciaretie,
      // fechatcacontractual: fechatcacontractual ?? this.fechatcacontractual,
      // fechaestimadatcacierremlm:
      // fechaestimadatcacierremlm ?? this.fechaestimadatcacierremlm,
      // hitotcacumplido: hitotcacumplido ?? this.hitotcacumplido,
      // plandeproduccion: plandeproduccion ?? this.plandeproduccion,
      // fechapruebasqmlm: fechapruebasqmlm ?? this.fechapruebasqmlm,
      // hitopruebasqcumplido: hitopruebasqcumplido ?? this.hitopruebasqcumplido,
      // rollingtenderdeclarado:
      // rollingtenderdeclarado ?? this.rollingtenderdeclarado,
      // rollingtenderno: rollingtenderno ?? this.rollingtenderno,
      // tiempoestimadodetransporte:
      // tiempoestimadodetransporte ?? this.tiempoestimadodetransporte,
      fechaentregaincotermactualizada: fechaentregaincotermactualizada ??
          this.fechaentregaincotermactualizada,
      // hitocumplido: hitocumplido ?? this.hitocumplido,
      fechacambio: fechacambio ?? this.fechacambio,
      personacambio: personacambio ?? this.personacambio,
      estado: estado ?? this.estado,
      tasa: tasa ?? this.tasa,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contrato': contrato,
      'documentocompras': documentocompras,
      'fechadocumento': fechadocumento,
      'proveedor': proveedor,
      'proyecto': proyecto,
      // 'bdg2024': bdg2024,
      'posicion': posicion,
      'material': material,
      'textobreve': textobreve,
      'unidadmedida': unidadmedida,
      'cantidaddepedido': cantidaddepedido,
      // 'conformado': conformado,
      'saldo': saldo,
      'moneda': moneda,
      'tasa': tasa,
      'precioneto': precioneto,
      'valornetodepedido': valornetodepedido,
      'subtotalcop': subtotalcop,
      'ivagastosnacionalizacion': ivagastosnacionalizacion,
      'factorivanac': factorivanac,
      'valortotalcop': valortotalcop,
      'vrpagado': vrpagado,
      'valoranticipo1': valoranticipo1,
      // 'nopdp': nopdp,
      'saldopendiente': saldopendiente,
      'fechadeentregaincoterm': fechadeentregaincoterm,
      // 'fechaconformidad': fechaconformidad,
      'mesequipo': mesequipo,
      'mesanticipos': mesanticipos,
      'gestor': gestor,
      // 'ou': ou,
      // 'familia': familia,
      'incoterm': incoterm,
      'puerto': puerto,
      // 'wbe': wbe,
      'observaciones1': observaciones1,
      'observaciones2': observaciones2,
      // 'fechafirmadelcontratodecontrato': fechafirmadelcontratodecontrato,
      // 'fechafinalizacioncontrato': fechafinalizacioncontrato,
      // 'fechaactadeinicio': fechaactadeinicio,
      // 'tiemposdetcadias': tiemposdetcadias,
      // 'tiemposdeentregadias': tiemposdeentregadias,
      // 'fechaentregaoda': fechaentregaoda,
      // 'fechaaprobaciondisenos': fechaaprobaciondisenos,
      // 'hitodisenocumplido': hitodisenocumplido,
      // 'retiesino': retiesino,
      // 'vigenciaretie': vigenciaretie,
      // 'fechatcacontractual': fechatcacontractual,
      // 'fechaestimadatcacierremlm': fechaestimadatcacierremlm,
      // 'hitotcacumplido': hitotcacumplido,
      // 'plandeproduccion': plandeproduccion,
      // 'fechapruebasqmlm': fechapruebasqmlm,
      // 'hitopruebasqcumplido': hitopruebasqcumplido,
      // 'rollingtenderdeclarado': rollingtenderdeclarado,
      // 'rollingtenderno': rollingtenderno,
      // 'tiempoestimadodetransporte': tiempoestimadodetransporte,
      'fechaentregaincotermactualizada': fechaentregaincotermactualizada,
      // 'hitocumplido': hitocumplido,
      'fechacambio': fechacambio,
      'personacambio': personacambio,
      'estado': estado,
    };
  }

  Map<String, dynamic> toMapInt() {
    return {
      'id': id,
      'contrato': contrato,
      'documentocompras': documentocompras,
      'fechadocumento': fechadocumento,
      'proveedor': proveedor,
      'proyecto': proyecto,
      // 'bdg2024': bdg2024,
      'posicion': posicion,
      'material': material,
      'textobreve': textobreve,
      'unidadmedida': unidadmedida,
      'cantidaddepedido': cantidaddepedido,
      // 'conformado': conformado,
      'saldo': saldo,
      'moneda': moneda,
      'tasa': aNum(tasa).floor().toString(),
      'precioneto': aNum(precioneto).floor().toString(),
      'valornetodepedido': aNum(valornetodepedido).floor().toString(),
      'subtotalcop': aNum(subtotalcop).floor().toString(),
      'ivagastosnacionalizacion':
          aNum(ivagastosnacionalizacion).floor().toString(),
      'factorivanac': factorivanac,
      'valortotalcop': aNum(valortotalcop).floor().toString(),
      'vrpagado': aNum(vrpagado).floor().toString(),
      'valoranticipo1': aNum(valoranticipo1).floor().toString(),
      // 'nopdp': nopdp,
      'saldopendiente': aNum(saldopendiente).floor().toString(),
      'fechadeentregaincoterm': fechadeentregaincoterm,
      // 'fechaconformidad': fechaconformidad,
      'mesequipo': mesequipo,
      'mesanticipos': mesanticipos,
      'gestor': gestor,
      // 'ou': ou,
      // 'familia': familia,
      'incoterm': incoterm,
      'puerto': puerto,
      // 'wbe': wbe,
      'observaciones1': observaciones1,
      'observaciones2': observaciones2,
      // 'fechafirmadelcontratodecontrato': fechafirmadelcontratodecontrato,
      // 'fechafinalizacioncontrato': fechafinalizacioncontrato,
      // 'fechaactadeinicio': fechaactadeinicio,
      // 'tiemposdetcadias': tiemposdetcadias,
      // 'tiemposdeentregadias': tiemposdeentregadias,
      // 'fechaentregaoda': fechaentregaoda,
      // 'fechaaprobaciondisenos': fechaaprobaciondisenos,
      // 'hitodisenocumplido': hitodisenocumplido,
      // 'retiesino': retiesino,
      // 'vigenciaretie': vigenciaretie,
      // 'fechatcacontractual': fechatcacontractual,
      // 'fechaestimadatcacierremlm': fechaestimadatcacierremlm,
      // 'hitotcacumplido': hitotcacumplido,
      // 'plandeproduccion': plandeproduccion,
      // 'fechapruebasqmlm': fechapruebasqmlm,
      // 'hitopruebasqcumplido': hitopruebasqcumplido,
      // 'rollingtenderdeclarado': rollingtenderdeclarado,
      // 'rollingtenderno': rollingtenderno,
      // 'tiempoestimadodetransporte': tiempoestimadodetransporte,
      'fechaentregaincotermactualizada': fechaentregaincotermactualizada,
      // 'hitocumplido': hitocumplido,
      'fechacambio': fechacambio,
      'personacambio': personacambio,
      'estado': estado,
    };
  }

  factory SegOda.fromMap(Map<String, dynamic> map) {
    DateTime hoy = DateTime.now();
    //Hito Diseño
    num? diasDiseno;
    bool disenoCumplido = map['hitodisenocumplido'].toString() == 'SI';
    bool existeFecha = map['fechaaprobaciondisenos'].toString().isNotEmpty &&
        map['fechaaprobaciondisenos'].toString().length > 9;
    if (disenoCumplido) diasDiseno = 0.1;
    if (!disenoCumplido && existeFecha) {
      DateTime fechaDiseno =
          DateTime.parse(map['fechaaprobaciondisenos'].toString());
      diasDiseno = fechaDiseno.difference(hoy).inDays;
    }

    //Hito TCA
    num? diasTca;
    bool tcaCumplido = map['hitotcacumplido'].toString() == 'SI';
    existeFecha = map['fechaestimadatcacierremlm'].toString().isNotEmpty &&
        map['fechaestimadatcacierremlm'].toString().length > 9;
    if (tcaCumplido) diasTca = 0.1;
    if (!tcaCumplido && existeFecha) {
      DateTime fechaTca =
          DateTime.parse(map['fechaestimadatcacierremlm'].toString());
      diasTca = fechaTca.difference(hoy).inDays;
    }

    //Hito Pruebas
    num? diasPruebas;
    bool pruebasCumplido = map['hitopruebasqcumplido'].toString() == 'SI';
    existeFecha = map['fechapruebasqmlm'].toString().isNotEmpty &&
        map['fechapruebasqmlm'].toString().length > 9;
    if (pruebasCumplido) diasPruebas = 0.1;
    if (!pruebasCumplido && existeFecha) {
      DateTime fechaPruebas =
          DateTime.parse(map['fechapruebasqmlm'].toString());
      diasPruebas = fechaPruebas.difference(hoy).inDays;
    }

    //Hito Entregas
    num? diasEntrega;
    bool entregaCumplido = map['hitocumplido'].toString() == 'SI';
    existeFecha =
        map['fechaentregaincotermactualizada'].toString().isNotEmpty &&
            map['fechaentregaincotermactualizada'].toString().length > 9;
    if (entregaCumplido) diasEntrega = 0.1;
    if (!entregaCumplido && existeFecha) {
      DateTime fechaEntrega =
          DateTime.parse(map['fechaentregaincotermactualizada'].toString());
      diasEntrega = fechaEntrega.difference(hoy).inDays;
    }

    return SegOda(
      id: map['id'].toString(),
      contrato: map['contrato'].toString(),
      documentocompras: map['documentocompras'].toString(),
      fechadocumento: map['fechadocumento'].toString().length > 10
          ? map['fechadocumento'].toString().substring(0, 10)
          : map['fechadocumento'].toString(),
      proveedor: map['proveedor'].toString().trim().toUpperCase(),
      proyecto: map['proyecto'].toString().trim().toUpperCase(),
      // bdg2024: map['bdg2024'].toString(),
      posicion: map['posicion'].toString(),
      material: map['material'].toString(),
      textobreve: map['textobreve'].toString(),
      unidadmedida: map['unidadmedida'].toString(),
      cantidaddepedido: map['cantidaddepedido'].toString(),
      // conformado: map['conformado'].toString(),
      saldo: map['saldo'].toString(),
      moneda: map['moneda'].toString(),
      precioneto: map['precioneto'].toString(),
      valornetodepedido: map['valornetodepedido'].toString(),
      subtotalcop: map['subtotalcop'].toString(),
      ivagastosnacionalizacion: map['ivagastosnacionalizacion'].toString(),
      factorivanac: map['factorivanac'].toString(),
      valortotalcop: map['valortotalcop'].toString(),
      vrpagado: map['vrpagado'].toString(),
      valoranticipo1: map['valoranticipo1'].toString(),
      // nopdp: map['nopdp'].toString(),
      saldopendiente: map['saldopendiente'].toString(),
      fechadeentregaincoterm:
          map['fechadeentregaincoterm'].toString().length > 10
              ? map['fechadeentregaincoterm'].toString().substring(0, 10)
              : map['fechadeentregaincoterm'].toString(),
      // fechaconformidad: map['fechaconformidad'].toString().length > 10
      //     ? map['fechaconformidad'].toString().substring(0, 10)
      //     : map['fechaconformidad'].toString(),
      mesequipo: map['mesequipo'].toString(),
      mesanticipos: map['mesanticipos'].toString(),
      gestor: map['gestor'].toString().trim().toUpperCase(),
      // ou: map['ou'].toString(),
      // familia: map['familia'].toString(),
      incoterm: map['incoterm'].toString(),
      puerto: map['puerto'].toString(),
      // wbe: map['wbe'].toString(),
      observaciones1: map['observaciones1'].toString(),
      observaciones2: map['observaciones2'].toString(),
      // fechafirmadelcontratodecontrato:
      //     map['fechafirmadelcontratodecontrato'].toString().length > 10
      //         ? map['fechafirmadelcontratodecontrato']
      //             .toString()
      //             .substring(0, 10)
      //         : map['fechafirmadelcontratodecontrato'].toString(),
      // fechafinalizacioncontrato:
      //     map['fechafinalizacioncontrato'].toString().length > 10
      //         ? map['fechafinalizacioncontrato'].toString().substring(0, 10)
      //         : map['fechafinalizacioncontrato'].toString(),
      // fechaactadeinicio: map['fechaactadeinicio'].toString().length > 10
      //     ? map['fechaactadeinicio'].toString().substring(0, 10)
      //     : map['fechaactadeinicio'].toString(),
      // tiemposdetcadias: map['tiemposdetcadias'].toString(),
      // tiemposdeentregadias: map['tiemposdeentregadias'].toString(),
      // fechaentregaoda: map['fechaentregaoda'].toString().length > 10
      //     ? map['fechaentregaoda'].toString().substring(0, 10)
      //     : map['fechaentregaoda'].toString(),
      // fechaaprobaciondisenos:
      //     map['fechaaprobaciondisenos'].toString().length > 10
      //         ? map['fechaaprobaciondisenos'].toString().substring(0, 10)
      //         : map['fechaaprobaciondisenos'].toString(),
      // hitodisenocumplido: map['hitodisenocumplido'].toString(),
      // retiesino: map['retiesino'].toString(),
      // vigenciaretie: map['vigenciaretie'].toString(),
      // fechatcacontractual: map['fechatcacontractual'].toString().length > 10
      //     ? map['fechatcacontractual'].toString().substring(0, 10)
      //     : map['fechatcacontractual'].toString(),
      // fechaestimadatcacierremlm:
      //     map['fechaestimadatcacierremlm'].toString().length > 10
      //         ? map['fechaestimadatcacierremlm'].toString().substring(0, 10)
      //         : map['fechaestimadatcacierremlm'].toString(),
      // hitotcacumplido: map['hitotcacumplido'].toString(),
      // plandeproduccion: map['plandeproduccion'].toString(),
      // fechapruebasqmlm: map['fechapruebasqmlm'].toString().length > 10
      //     ? map['fechapruebasqmlm'].toString().substring(0, 10)
      //     : map['fechapruebasqmlm'].toString(),
      // hitopruebasqcumplido: map['hitopruebasqcumplido'].toString(),
      // rollingtenderdeclarado: map['rollingtenderdeclarado'].toString(),
      // rollingtenderno: map['rollingtenderno'].toString(),
      // tiempoestimadodetransporte: map['tiempoestimadodetransporte'].toString(),
      fechaentregaincotermactualizada:
          map['fechaentregaincotermactualizada'].toString().length > 10
              ? map['fechaentregaincotermactualizada']
                  .toString()
                  .substring(0, 10)
              : map['fechaentregaincotermactualizada'].toString(),
      // hitocumplido: map['hitocumplido'].toString(),
      fechacambio: map['fechacambio'].toString(),
      personacambio: map['personacambio'].toString(),
      estado: map['estado'].toString(),
      tasa: map['tasa'].toString(),
    )
      ..diasDiseno = diasDiseno
      ..diasTca = diasTca
      ..diasPruebas = diasPruebas
      ..diasEntrega = diasEntrega;
  }

  factory SegOda.nuevo() {
    return SegOda(
      id: '',
      contrato: '',
      documentocompras: '',
      fechadocumento: '',
      proveedor: '',
      proyecto: '',
      // bdg2024: '',
      posicion: '',
      material: '',
      textobreve: '',
      unidadmedida: '',
      cantidaddepedido: '',
      // conformado: '',
      saldo: '',
      moneda: '',
      precioneto: '',
      valornetodepedido: '',
      subtotalcop: '',
      ivagastosnacionalizacion: '',
      factorivanac: '19',
      valortotalcop: '',
      vrpagado: '',
      valoranticipo1: '',
      // nopdp: '',
      saldopendiente: '',
      fechadeentregaincoterm: '',
      // fechaconformidad: '',
      mesequipo: '',
      mesanticipos: '',
      gestor: '',
      // ou: '',
      // familia: '',
      incoterm: '',
      puerto: '',
      // wbe: '',
      observaciones1: '',
      observaciones2: '',
      // fechafirmadelcontratodecontrato: '',
      // fechafinalizacioncontrato: '',
      // fechaactadeinicio: '',
      // tiemposdetcadias: '',
      // tiemposdeentregadias: '',
      // fechaentregaoda: '',
      // fechaaprobaciondisenos: '',
      // hitodisenocumplido: '',
      // retiesino: '',
      // vigenciaretie: '',
      // fechatcacontractual: '',
      // fechaestimadatcacierremlm: '',
      // hitotcacumplido: '',
      // plandeproduccion: '',
      // fechapruebasqmlm: '',
      // hitopruebasqcumplido: '',
      // rollingtenderdeclarado: '',
      // rollingtenderno: '',
      // tiempoestimadodetransporte: '',
      fechaentregaincotermactualizada: '',
      // hitocumplido: '',
      fechacambio: '',
      personacambio: '',
      estado: '',
      tasa: '1',
    );
  }

  String toJson() => json.encode(toMap());

  factory SegOda.fromJson(String source) => SegOda.fromMap(json.decode(source));



  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SegOda &&
        other.contrato == contrato &&
        other.documentocompras == documentocompras &&
        other.fechadocumento == fechadocumento &&
        other.proveedor == proveedor &&
        other.proyecto == proyecto &&
        // other.bdg2024 == bdg2024 &&
        other.posicion == posicion &&
        other.material == material &&
        other.textobreve == textobreve &&
        other.unidadmedida == unidadmedida &&
        other.cantidaddepedido == cantidaddepedido &&
        // other.conformado == conformado &&
        other.saldo == saldo &&
        other.moneda == moneda &&
        other.precioneto == precioneto &&
        other.valornetodepedido == valornetodepedido &&
        other.subtotalcop == subtotalcop &&
        other.ivagastosnacionalizacion == ivagastosnacionalizacion &&
        other.valortotalcop == valortotalcop &&
        other.vrpagado == vrpagado &&
        other.valoranticipo1 == valoranticipo1 &&
        // other.nopdp == nopdp &&
        other.saldopendiente == saldopendiente &&
        other.fechadeentregaincoterm == fechadeentregaincoterm &&
        // other.fechaconformidad == fechaconformidad &&
        other.mesequipo == mesequipo &&
        other.mesanticipos == mesanticipos &&
        other.gestor == gestor &&
        // other.ou == ou &&
        // other.familia == familia &&
        other.incoterm == incoterm &&
        other.puerto == puerto &&
        // other.wbe == wbe &&
        other.observaciones1 == observaciones1 &&
        other.observaciones2 == observaciones2 &&
        // other.fechafirmadelcontratodecontrato ==
        //     fechafirmadelcontratodecontrato &&
        // other.fechafinalizacioncontrato == fechafinalizacioncontrato &&
        // other.fechaactadeinicio == fechaactadeinicio &&
        // other.tiemposdetcadias == tiemposdetcadias &&
        // other.tiemposdeentregadias == tiemposdeentregadias &&
        // other.fechaentregaoda == fechaentregaoda &&
        // other.fechaaprobaciondisenos == fechaaprobaciondisenos &&
        // other.hitodisenocumplido == hitodisenocumplido &&
        // other.retiesino == retiesino &&
        // other.vigenciaretie == vigenciaretie &&
        // other.fechatcacontractual == fechatcacontractual &&
        // other.fechaestimadatcacierremlm == fechaestimadatcacierremlm &&
        // other.hitotcacumplido == hitotcacumplido &&
        // other.plandeproduccion == plandeproduccion &&
        // other.fechapruebasqmlm == fechapruebasqmlm &&
        // other.hitopruebasqcumplido == hitopruebasqcumplido &&
        // other.rollingtenderdeclarado == rollingtenderdeclarado &&
        // other.rollingtenderno == rollingtenderno &&
        // other.tiempoestimadodetransporte == tiempoestimadodetransporte &&
        other.fechaentregaincotermactualizada ==
            fechaentregaincotermactualizada;
    // other.hitocumplido == hitocumplido;
  }

  @override
  int get hashCode {
    return contrato.hashCode ^
        documentocompras.hashCode ^
        fechadocumento.hashCode ^
        proveedor.hashCode ^
        proyecto.hashCode ^
        // bdg2024.hashCode ^
        posicion.hashCode ^
        material.hashCode ^
        textobreve.hashCode ^
        unidadmedida.hashCode ^
        cantidaddepedido.hashCode ^
        // conformado.hashCode ^
        saldo.hashCode ^
        moneda.hashCode ^
        precioneto.hashCode ^
        valornetodepedido.hashCode ^
        subtotalcop.hashCode ^
        ivagastosnacionalizacion.hashCode ^
        valortotalcop.hashCode ^
        vrpagado.hashCode ^
        valoranticipo1.hashCode ^
        // nopdp.hashCode ^
        saldopendiente.hashCode ^
        fechadeentregaincoterm.hashCode ^
        // fechaconformidad.hashCode ^
        mesequipo.hashCode ^
        mesanticipos.hashCode ^
        gestor.hashCode ^
        // ou.hashCode ^
        // familia.hashCode ^
        incoterm.hashCode ^
        puerto.hashCode ^
        // wbe.hashCode ^
        observaciones1.hashCode ^
        observaciones2.hashCode ^
        // fechafirmadelcontratodecontrato.hashCode ^
        // fechafinalizacioncontrato.hashCode ^
        // fechaactadeinicio.hashCode ^
        // tiemposdetcadias.hashCode ^
        // tiemposdeentregadias.hashCode ^
        // fechaentregaoda.hashCode ^
        // fechaaprobaciondisenos.hashCode ^
        // hitodisenocumplido.hashCode ^
        // retiesino.hashCode ^
        // vigenciaretie.hashCode ^
        // fechatcacontractual.hashCode ^
        // fechaestimadatcacierremlm.hashCode ^
        // hitotcacumplido.hashCode ^
        // plandeproduccion.hashCode ^
        // fechapruebasqmlm.hashCode ^
        // hitopruebasqcumplido.hashCode ^
        // rollingtenderdeclarado.hashCode ^
        // rollingtenderno.hashCode ^
        // tiempoestimadodetransporte.hashCode ^
        fechaentregaincotermactualizada.hashCode;
    // hitocumplido.hashCode;
  }

  List<String> toList() {
    return [
      id,
      contrato,
      documentocompras,
      fechadocumento,
      proveedor,
      proyecto,
      // bdg2024,
      posicion,
      material,
      textobreve,
      unidadmedida,
      cantidaddepedido,
      // conformado,
      saldo,
      moneda,
      precioneto,
      valornetodepedido,
      subtotalcop,
      ivagastosnacionalizacion,
      factorivanac,
      valortotalcop,
      vrpagado,
      valoranticipo1,
      // nopdp,
      saldopendiente,
      fechadeentregaincoterm,
      // fechaconformidad,
      mesequipo,
      mesanticipos,
      gestor,
      // ou,
      // familia,
      incoterm,
      puerto,
      // wbe,
      observaciones1,
      observaciones2,
      // fechafirmadelcontratodecontrato,
      // fechafinalizacioncontrato,
      // fechaactadeinicio,
      // tiemposdetcadias,
      // tiemposdeentregadias,
      // fechaentregaoda,
      // fechaaprobaciondisenos,
      // hitodisenocumplido,
      // retiesino,
      // vigenciaretie,
      // fechatcacontractual,
      // fechaestimadatcacierremlm,
      // hitotcacumplido,
      // plandeproduccion,
      // fechapruebasqmlm,
      // hitopruebasqcumplido,
      // rollingtenderdeclarado,
      // rollingtenderno,
      // tiempoestimadodetransporte,
      fechaentregaincotermactualizada,
      // hitocumplido,
      fechacambio,
      personacambio,
      estado,
      tasa
    ];
  }

  void asignar({
    required CampoSegOda campo,
    required String valor,
  }) {
    if (campo == CampoSegOda.id) id = valor;
    if (campo == CampoSegOda.contrato) contrato = valor;
    if (campo == CampoSegOda.documentocompras) documentocompras = valor;
    if (campo == CampoSegOda.fechadocumento) fechadocumento = valor;
    if (campo == CampoSegOda.proveedor) proveedor = valor;
    if (campo == CampoSegOda.proyecto) proyecto = valor;
    // if (campo == CampoSegOda.bdg2024) bdg2024 = valor;
    if (campo == CampoSegOda.posicion) posicion = valor;
    if (campo == CampoSegOda.material) material = valor;
    if (campo == CampoSegOda.textobreve) textobreve = valor;
    if (campo == CampoSegOda.unidadmedida) unidadmedida = valor;
    if (campo == CampoSegOda.cantidaddepedido) cantidaddepedido = valor;
    // if (campo == CampoSegOda.conformado) conformado = valor;
    if (campo == CampoSegOda.saldo) saldo = valor;
    if (campo == CampoSegOda.moneda) moneda = valor;
    if (campo == CampoSegOda.precioneto) precioneto = valor;
    if (campo == CampoSegOda.valornetodepedido) valornetodepedido = valor;
    if (campo == CampoSegOda.subtotalcop) subtotalcop = valor;
    if (campo == CampoSegOda.ivagastosnacionalizacion) {
      ivagastosnacionalizacion = valor;
    }
    if (campo == CampoSegOda.factorivanac) factorivanac = valor;
    if (campo == CampoSegOda.valortotalcop) valortotalcop = valor;
    if (campo == CampoSegOda.vrpagado) vrpagado = valor;
    if (campo == CampoSegOda.valoranticipo1) valoranticipo1 = valor;
    // if (campo == CampoSegOda.nopdp) nopdp = valor;
    if (campo == CampoSegOda.saldopendiente) saldopendiente = valor;
    if (campo == CampoSegOda.fechadeentregaincoterm) {
      fechadeentregaincoterm = valor;
    }
    // if (campo == CampoSegOda.fechaconformidad) fechaconformidad = valor;
    if (campo == CampoSegOda.mesequipo) mesequipo = valor;
    if (campo == CampoSegOda.mesanticipos) mesanticipos = valor;
    if (campo == CampoSegOda.gestor) gestor = valor;
    // if (campo == CampoSegOda.ou) ou = valor;
    // if (campo == CampoSegOda.familia) familia = valor;
    if (campo == CampoSegOda.incoterm) incoterm = valor;
    if (campo == CampoSegOda.puerto) puerto = valor;
    // if (campo == CampoSegOda.wbe) wbe = valor;
    if (campo == CampoSegOda.observaciones1) observaciones1 = valor;
    if (campo == CampoSegOda.observaciones2) observaciones2 = valor;
    // if (campo == CampoSegOda.fechafirmadelcontratodecontrato) {
    // fechafirmadelcontratodecontrato = valor;
    // }
    // if (campo == CampoSegOda.fechafinalizacioncontrato) {
    // fechafinalizacioncontrato = valor;
    // }
    // if (campo == CampoSegOda.fechaactadeinicio) fechaactadeinicio = valor;
    // if (campo == CampoSegOda.tiemposdetcadias) tiemposdetcadias = valor;
    // if (campo == CampoSegOda.tiemposdeentregadias) tiemposdeentregadias = valor;
    // if (campo == CampoSegOda.fechaentregaoda) fechaentregaoda = valor;
    // if (campo == CampoSegOda.fechaaprobaciondisenos) {
    //   fechaaprobaciondisenos = valor;
    // }
    // if (campo == CampoSegOda.hitodisenocumplido) hitodisenocumplido = valor;
    // if (campo == CampoSegOda.retiesino) retiesino = valor;
    // if (campo == CampoSegOda.vigenciaretie) vigenciaretie = valor;
    // if (campo == CampoSegOda.fechatcacontractual) fechatcacontractual = valor;
    // if (campo == CampoSegOda.fechaestimadatcacierremlm) {
    //   fechaestimadatcacierremlm = valor;
    // }
    // if (campo == CampoSegOda.hitotcacumplido) hitotcacumplido = valor;
    // if (campo == CampoSegOda.plandeproduccion) plandeproduccion = valor;
    // if (campo == CampoSegOda.fechapruebasqmlm) fechapruebasqmlm = valor;
    // if (campo == CampoSegOda.hitopruebasqcumplido) hitopruebasqcumplido = valor;
    // if (campo == CampoSegOda.rollingtenderdeclarado) {
    //   rollingtenderdeclarado = valor;
    // }
    // if (campo == CampoSegOda.rollingtenderno) rollingtenderno = valor;
    // if (campo == CampoSegOda.tiempoestimadodetransporte) {
    //   tiempoestimadodetransporte = valor;
    // }
    // if (campo == CampoSegOda.fechaentregaincotermactualizada) {
    //   fechaentregaincotermactualizada = valor;
    // }
    // if (campo == CampoSegOda.hitocumplido) hitocumplido = valor;
    // if (campo == CampoSegOda.tasa) tasa = valor;
  }

  String get proveedorCorregido {
    if (proveedor.startsWith('2') && proveedor.length > 10) {
      return proveedor.substring(11).toUpperCase();
    }
    return proveedor.toUpperCase();
  }

  String diasTexto(num? dias) {
    if (dias == null) return "No\nInfo";
    if (dias == 0.1) return "OK";
    return '$dias';
  }

  Color? diasColor(num? dias) {
    if (dias == null) return Colors.grey[300]!;
    if (dias == 0.1) return Colors.green;
    if (dias < 0) return Colors.red;
    return null;
  }

  List<ToCelda> get celdas => [
        ToCelda(valor: proveedorCorregido, flex: 5),
        ToCelda(valor: documentocompras, flex: 2),
        ToCelda(valor: posicion, flex: 1),
        ToCelda(valor: proyecto, flex: 4),
        ToCelda(valor: material, flex: 2),
        ToCelda(valor: textobreve, flex: 5),
        ToCelda(valor: cantidaddepedido, flex: 1),
        ToCelda(valor: gestor, flex: 2),
        ToCelda(valor: mesequipo, flex: 1),
        ToCelda(
          valor: diasTexto(diasDiseno),
          flex: 1,
          colorFuente: diasColor(diasDiseno),
        ),
        ToCelda(
          valor: diasTexto(diasTca),
          flex: 1,
          colorFuente: diasColor(diasTca),
        ),
        ToCelda(
          valor: diasTexto(diasPruebas),
          flex: 1,
          colorFuente: diasColor(diasPruebas),
        ),
        ToCelda(
          valor: diasTexto(diasEntrega),
          flex: 1,
          colorFuente: diasColor(diasEntrega),
        ),
      ];

  String enMillon(num mes) {
    return toCurrency$('${(mes / 1000000).toStringAsFixed(0)}');
  }

  Color? colorNumero(num mes) {
    if (mes == 0) return Colors.grey[300]!;
    return null;
  }

  List<ToCelda> get celdasDinero => [
        ToCelda(valor: proveedorCorregido, flex: 5),
        ToCelda(valor: documentocompras, flex: 2),
        ToCelda(valor: posicion, flex: 1),
        ToCelda(valor: proyecto, flex: 4),
        ToCelda(valor: material, flex: 2),
        ToCelda(valor: textobreve, flex: 5),
        ToCelda(valor: cantidaddepedido, flex: 1),
        ToCelda(valor: gestor, flex: 4),
        ToCelda(
          valor: mesequipo,
          flex: 1,
          editar: true,
          campo: 'mesequipo',
        ),
        ToCelda(
          valor: enMillon(aNum(valortotalcop)),
          flex: 2,
          colorFuente: colorNumero(aNum(valortotalcop)),
        ),
        ToCelda(
          valor: mesanticipos,
          flex: 1,
          editar: true,
          campo: 'mesanticipos',
        ),
        ToCelda(
          valor: enMillon(aNum(valoranticipo1)),
          flex: 2,
          colorFuente: colorNumero(aNum(valoranticipo1)),
        ),
        ToCelda(
          valor: observaciones1,
          flex: 4,
          editar: true,
          campo: 'observaciones1',
        ),
        ToCelda(
          valor: fechacambio.isNotEmpty
              ? fechacambio.substring(0, 10)
              : fechacambio,
          flex: 1,
        ),
      ];

  List<String> get errores {
    List<String> errores = [];
    if (contratoColor == Colors.red) errores.add("Contrato");
    if (documentocomprasColor == Colors.red) errores.add("Documento Compras");
    if (fechadocumentoColor == Colors.red) errores.add("Fecha Documento");
    if (proveedorColor == Colors.red) errores.add("proveedor");
    if (proyectoColor == Colors.red) errores.add("proyecto");
    if (bdg2024Color == Colors.red) errores.add("bdg2024");
    if (posicionColor == Colors.red) errores.add("posicion");
    if (materialColor == Colors.red) errores.add("material");
    if (textobreveColor == Colors.red) errores.add("textobreve");
    if (unidadmedidaColor == Colors.red) errores.add("unidadmedida");
    if (cantidaddepedidoColor == Colors.red) errores.add("cantidaddepedido");
    if (conformadoColor == Colors.red) errores.add("conformado");
    if (saldoColor == Colors.red) errores.add("saldo");
    if (monedaColor == Colors.red) errores.add("moneda");
    if (precionetoColor == Colors.red) errores.add("precioneto");
    if (valornetodepedidoColor == Colors.red) errores.add("valornetodepedido");
    if (subtotalcopColor == Colors.red) errores.add("subtotalcop");
    if (ivagastosnacionalizacionColor == Colors.red)
      errores.add("ivagastosnacionalizacion");
    if (factorivanacColor == Colors.red) errores.add("factorivanac");
    if (valortotalcopColor == Colors.red) errores.add("valortotalcop");
    if (vrpagadoColor == Colors.red) errores.add("vrpagado");
    if (valoranticipo1Color == Colors.red) errores.add("valoranticipo1");
    if (nopdpColor == Colors.red) errores.add("nopdp");
    if (saldopendienteColor == Colors.red) errores.add("saldopendiente");
    if (fechadeentregaincotermColor == Colors.red)
      errores.add("fechadeentregaincoterm");
    if (fechaconformidadColor == Colors.red) errores.add("fechaconformidad");
    if (mesequipoColor == Colors.red) errores.add("Mes Equipo");
    if (mesanticiposColor == Colors.red) errores.add("mesanticipos");
    if (gestorColor == Colors.red) errores.add("gestor");
    if (ouColor == Colors.red) errores.add("ou");
    if (familiaColor == Colors.red) errores.add("familia");
    if (incotermColor == Colors.red) errores.add("incoterm");
    if (puertoColor == Colors.red) errores.add("puerto");
    if (wbeColor == Colors.red) errores.add("wbe");
    if (observaciones1Color == Colors.red) errores.add("observaciones1");
    if (observaciones2Color == Colors.red) errores.add("observaciones2");
    if (fechafirmadelcontratodecontratoColor == Colors.red)
      errores.add("fechafirmadelcontratodecontrato");
    if (fechafinalizacioncontratoColor == Colors.red)
      errores.add("fechafinalizacioncontrato");
    if (fechaactadeinicioColor == Colors.red) errores.add("fechaactadeinicio");
    if (tiemposdetcadiasColor == Colors.red) errores.add("tiemposdetcadias");
    if (tiemposdeentregadiasColor == Colors.red)
      errores.add("tiemposdeentregadias");
    if (fechaentregaodaColor == Colors.red) errores.add("fechaentregaoda");
    if (fechaaprobaciondisenosColor == Colors.red)
      errores.add("fechaaprobaciondisenos");
    if (hitodisenocumplidoColor == Colors.red)
      errores.add("hitodisenocumplido");
    if (retiesinoColor == Colors.red) errores.add("retiesino");
    if (vigenciaretieColor == Colors.red) errores.add("vigenciaretie");
    if (fechatcacontractualColor == Colors.red)
      errores.add("fechatcacontractual");
    if (fechaestimadatcacierremlmColor == Colors.red)
      errores.add("fechaestimadatcacierremlm");
    if (hitotcacumplidoColor == Colors.red) errores.add("hitotcacumplido");
    if (plandeproduccionColor == Colors.red) errores.add("plandeproduccion");
    if (fechapruebasqmlmColor == Colors.red) errores.add("fechapruebasqmlm");
    if (hitopruebasqcumplidoColor == Colors.red)
      errores.add("hitopruebasqcumplido");
    if (rollingtenderdeclaradoColor == Colors.red)
      errores.add("rollingtenderdeclarado");
    if (rollingtendernoColor == Colors.red) errores.add("rollingtenderno");
    if (tiempoestimadodetransporteColor == Colors.red)
      errores.add("tiempoestimadodetransporte");
    if (fechaentregaincotermactualizadaColor == Colors.red)
      errores.add("fechaentregaincotermactualizada");
    if (hitocumplidoColor == Colors.red) errores.add("hitocumplido");
    if (tasaColor == Colors.red) errores.add("tasa");
    return errores;
  }

  @override
  String toString() {
    return 'SegOda(id: $id, contrato: $contrato, documentocompras: $documentocompras, fechadocumento: $fechadocumento, proveedor: $proveedor, proyecto: $proyecto, posicion: $posicion, material: $material, textobreve: $textobreve, unidadmedida: $unidadmedida, cantidaddepedido: $cantidaddepedido, saldo: $saldo, moneda: $moneda, precioneto: $precioneto, valornetodepedido: $valornetodepedido, subtotalcop: $subtotalcop, ivagastosnacionalizacion: $ivagastosnacionalizacion, factorivanac: $factorivanac, valortotalcop: $valortotalcop, vrpagado: $vrpagado, valoranticipo1: $valoranticipo1, saldopendiente: $saldopendiente, fechadeentregaincoterm: $fechadeentregaincoterm, mesequipo: $mesequipo, mesanticipos: $mesanticipos, gestor: $gestor, incoterm: $incoterm, puerto: $puerto, observaciones1: $observaciones1, observaciones2: $observaciones2, fechaentregaincotermactualizada: $fechaentregaincotermactualizada, fechacambio: $fechacambio, personacambio: $personacambio, estado: $estado, tasa: $tasa, contratoColor: $contratoColor, documentocomprasColor: $documentocomprasColor, fechadocumentoColor: $fechadocumentoColor, proveedorColor: $proveedorColor, proyectoColor: $proyectoColor, bdg2024Color: $bdg2024Color, posicionColor: $posicionColor, materialColor: $materialColor, textobreveColor: $textobreveColor, unidadmedidaColor: $unidadmedidaColor, cantidaddepedidoColor: $cantidaddepedidoColor, conformadoColor: $conformadoColor, saldoColor: $saldoColor, monedaColor: $monedaColor, precionetoColor: $precionetoColor, valornetodepedidoColor: $valornetodepedidoColor, subtotalcopColor: $subtotalcopColor, ivagastosnacionalizacionColor: $ivagastosnacionalizacionColor, factorivanacColor: $factorivanacColor, valortotalcopColor: $valortotalcopColor, vrpagadoColor: $vrpagadoColor, valoranticipo1Color: $valoranticipo1Color, nopdpColor: $nopdpColor, saldopendienteColor: $saldopendienteColor, fechadeentregaincotermColor: $fechadeentregaincotermColor, fechaconformidadColor: $fechaconformidadColor, mesequipoColor: $mesequipoColor, mesanticiposColor: $mesanticiposColor, gestorColor: $gestorColor, ouColor: $ouColor, familiaColor: $familiaColor, incotermColor: $incotermColor, puertoColor: $puertoColor, wbeColor: $wbeColor, observaciones1Color: $observaciones1Color, observaciones2Color: $observaciones2Color, fechafirmadelcontratodecontratoColor: $fechafirmadelcontratodecontratoColor, fechafinalizacioncontratoColor: $fechafinalizacioncontratoColor, fechaactadeinicioColor: $fechaactadeinicioColor, tiemposdetcadiasColor: $tiemposdetcadiasColor, tiemposdeentregadiasColor: $tiemposdeentregadiasColor, fechaentregaodaColor: $fechaentregaodaColor, fechaaprobaciondisenosColor: $fechaaprobaciondisenosColor, hitodisenocumplidoColor: $hitodisenocumplidoColor, retiesinoColor: $retiesinoColor, vigenciaretieColor: $vigenciaretieColor, fechatcacontractualColor: $fechatcacontractualColor, fechaestimadatcacierremlmColor: $fechaestimadatcacierremlmColor, hitotcacumplidoColor: $hitotcacumplidoColor, plandeproduccionColor: $plandeproduccionColor, fechapruebasqmlmColor: $fechapruebasqmlmColor, hitopruebasqcumplidoColor: $hitopruebasqcumplidoColor, rollingtenderdeclaradoColor: $rollingtenderdeclaradoColor, rollingtendernoColor: $rollingtendernoColor, tiempoestimadodetransporteColor: $tiempoestimadodetransporteColor, fechaentregaincotermactualizadaColor: $fechaentregaincotermactualizadaColor, hitocumplidoColor: $hitocumplidoColor, tasaColor: $tasaColor, diasDiseno: $diasDiseno, diasTca: $diasTca, diasPruebas: $diasPruebas, diasEntrega: $diasEntrega)';
  }
}
