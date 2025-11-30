import 'dart:convert';

import 'package:com/resources/to_celda.dart';
import 'package:intl/intl.dart';

class ListadoOdasFila {
  int oda;
  int pos;
  String e4e;
  String descripcion;
  String um;
  num ctd;
  num entregado;
  num porentregar;
  num cantidadbase;
  num precioneto;
  num valorneto;
  String valorliberado;
  String moneda;
  DateTime fechapedido;
  DateTime fechaentrega;
  String inco;
  String destino;
  String tipomaterial;
  String pagoen;
  String proveedor;
  String contrato;
  int poscontrato;
  String centro;
  String usuario;
  DateTime actualizado;
  ListadoOdasFila({
    required this.oda,
    required this.pos,
    required this.e4e,
    required this.descripcion,
    required this.um,
    required this.ctd,
    required this.entregado,
    required this.porentregar,
    required this.cantidadbase,
    required this.precioneto,
    required this.valorneto,
    required this.valorliberado,
    required this.moneda,
    required this.fechapedido,
    required this.fechaentrega,
    required this.inco,
    required this.destino,
    required this.tipomaterial,
    required this.pagoen,
    required this.proveedor,
    required this.contrato,
    required this.poscontrato,
    required this.centro,
    required this.usuario,
    required this.actualizado,
  });

  List<String> toList() {
    return [
      oda.toString(),
      pos.toString(),
      e4e,
      descripcion,
      um,
      ctd.toString(),
      entregado.toString(),
      porentregar.toString(),
      cantidadbase.toString(),
      precioneto.toString(),
      valorneto.toString(),
      valorliberado,
      moneda,
      fechapedido.toString(),
      fechaentrega.toString(),
      inco,
      destino,
      tipomaterial,
      pagoen,
      proveedor,
      contrato,
      poscontrato.toString(),
      centro,
      usuario,
      actualizado.toString(),
    ];
  }

  List<ToCelda> get celdas {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    NumberFormat currencyFormat =
        NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    return [
      ToCelda(valor: oda.toString(), flex: 2),
      ToCelda(valor: pos.toString(), flex: 1),
      ToCelda(valor: e4e, flex: 2),
      ToCelda(valor: descripcion, flex: 4),
      ToCelda(valor: um, flex: 1),
      ToCelda(valor: ctd.toString(), flex: 2),
      ToCelda(valor: entregado.toString(), flex: 2),
      ToCelda(valor: porentregar.toString(), flex: 2),
      ToCelda(valor: cantidadbase.toString(), flex: 2),
      ToCelda(valor: currencyFormat.format(precioneto), flex: 2),
      ToCelda(valor: currencyFormat.format(valorneto), flex: 2),
      ToCelda(valor: moneda, flex: 1),
      ToCelda(valor: dateFormat.format(fechapedido), flex: 2),
      ToCelda(valor: dateFormat.format(fechaentrega), flex: 2),
      ToCelda(valor: inco, flex: 1),
      ToCelda(valor: destino, flex: 2),
      ToCelda(valor: proveedor, flex: 2),
      ToCelda(valor: contrato, flex: 2),
    ];
  }

  ListadoOdasFila copyWith({
    int? oda,
    int? pos,
    String? e4e,
    String? descripcion,
    String? um,
    num? ctd,
    num? entregado,
    num? porentregar,
    num? cantidadbase,
    num? precioneto,
    num? valorneto,
    String? valorliberado,
    String? moneda,
    DateTime? fechapedido,
    DateTime? fechaentrega,
    String? inco,
    String? destino,
    String? tipomaterial,
    String? pagoen,
    String? proveedor,
    String? contrato,
    int? poscontrato,
    String? centro,
    String? usuario,
    DateTime? actualizado,
  }) {
    return ListadoOdasFila(
      oda: oda ?? this.oda,
      pos: pos ?? this.pos,
      e4e: e4e ?? this.e4e,
      descripcion: descripcion ?? this.descripcion,
      um: um ?? this.um,
      ctd: ctd ?? this.ctd,
      entregado: entregado ?? this.entregado,
      porentregar: porentregar ?? this.porentregar,
      cantidadbase: cantidadbase ?? this.cantidadbase,
      precioneto: precioneto ?? this.precioneto,
      valorneto: valorneto ?? this.valorneto,
      valorliberado: valorliberado ?? this.valorliberado,
      moneda: moneda ?? this.moneda,
      fechapedido: fechapedido ?? this.fechapedido,
      fechaentrega: fechaentrega ?? this.fechaentrega,
      inco: inco ?? this.inco,
      destino: destino ?? this.destino,
      tipomaterial: tipomaterial ?? this.tipomaterial,
      pagoen: pagoen ?? this.pagoen,
      proveedor: proveedor ?? this.proveedor,
      contrato: contrato ?? this.contrato,
      poscontrato: poscontrato ?? this.poscontrato,
      centro: centro ?? this.centro,
      usuario: usuario ?? this.usuario,
      actualizado: actualizado ?? this.actualizado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'oda': oda,
      'pos': pos,
      'e4e': e4e,
      'descripcion': descripcion,
      'um': um,
      'ctd': ctd,
      'entregado': entregado,
      'porentregar': porentregar,
      'cantidadbase': cantidadbase,
      'precioneto': precioneto,
      'valorneto': valorneto,
      'valorliberado': valorliberado,
      'moneda': moneda,
      'fechapedido': fechapedido.millisecondsSinceEpoch,
      'fechaentrega': fechaentrega.millisecondsSinceEpoch,
      'inco': inco,
      'destino': destino,
      'tipomaterial': tipomaterial,
      'pagoen': pagoen,
      'proveedor': proveedor,
      'contrato': contrato,
      'poscontrato': poscontrato,
      'centro': centro,
      'usuario': usuario,
      'actualizado': actualizado.millisecondsSinceEpoch,
    };
  }

  factory ListadoOdasFila.fromMap(Map<String, dynamic> map) {
    DateFormat format = DateFormat('dd/M/yyyy, hh:mm:ss a', 'es');
    return ListadoOdasFila(
      oda: map['oda']?.toInt() ?? 0,
      pos: map['pos']?.toInt() ?? 0,
      e4e: map['e4e'].toString(),
      descripcion: map['descripcion'].toString(),
      um: map['um'].toString(),
      ctd: map['ctd'] ?? 0,
      entregado: map['entregado'] ?? 0,
      porentregar: map['porentregar'] ?? 0,
      cantidadbase: map['cantidadbase'] ?? 0,
      precioneto: map['precioneto'] ?? 0,
      valorneto: map['valorneto'] ?? 0,
      valorliberado: map['valorliberado'].toString(),
      moneda: map['moneda'].toString(),
      fechapedido: DateTime.parse(map['fechapedido']),
      fechaentrega: DateTime.parse(map['fechaentrega']),
      inco: map['inco'].toString(),
      destino: map['destino'].toString(),
      tipomaterial: map['tipomaterial'].toString(),
      pagoen: map['pagoen'].toString(),
      proveedor: map['proveedor'].toString(),
      contrato: map['contrato'].toString(),
      poscontrato: map['poscontrato']?.toInt() ?? 0,
      centro: map['centro'].toString(),
      usuario: map['usuario'].toString(),
      actualizado: format.parse(map['actualizado']),
    );
  }

  factory ListadoOdasFila.fromInit() {
    return ListadoOdasFila(
      oda: 0,
      pos: 0,
      e4e: '',
      descripcion: '',
      um: '',
      ctd: 0,
      entregado: 0,
      porentregar: 0,
      cantidadbase: 0,
      precioneto: 0,
      valorneto: 0,
      valorliberado: '',
      moneda: '',
      fechapedido: DateTime.now(),
      fechaentrega: DateTime.now(),
      inco: '',
      destino: '',
      tipomaterial: '',
      pagoen: '',
      proveedor: '',
      contrato: '',
      poscontrato: 0,
      centro: '',
      usuario: '',
      actualizado: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListadoOdasFila.fromJson(String source) =>
      ListadoOdasFila.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListadoOdasFila(oda: $oda, pos: $pos, e4e: $e4e, descripcion: $descripcion, um: $um, ctd: $ctd, entregado: $entregado, porentregar: $porentregar, precioneto: $precioneto, valorneto: $valorneto, valorliberado: $valorliberado, moneda: $moneda, fechapedido: $fechapedido, fechaentrega: $fechaentrega, inco: $inco, destino: $destino, tipomaterial: $tipomaterial, pagoen: $pagoen, proveedor: $proveedor, contrato: $contrato, poscontrato: $poscontrato, centro: $centro, usuario: $usuario, actualizado: $actualizado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListadoOdasFila &&
        other.oda == oda &&
        other.pos == pos &&
        other.e4e == e4e &&
        other.descripcion == descripcion &&
        other.um == um &&
        other.ctd == ctd &&
        other.entregado == entregado &&
        other.porentregar == porentregar &&
        other.precioneto == precioneto &&
        other.valorneto == valorneto &&
        other.valorliberado == valorliberado &&
        other.moneda == moneda &&
        other.fechapedido == fechapedido &&
        other.fechaentrega == fechaentrega &&
        other.inco == inco &&
        other.destino == destino &&
        other.tipomaterial == tipomaterial &&
        other.pagoen == pagoen &&
        other.proveedor == proveedor &&
        other.contrato == contrato &&
        other.poscontrato == poscontrato &&
        other.centro == centro &&
        other.usuario == usuario &&
        other.actualizado == actualizado;
  }

  @override
  int get hashCode {
    return oda.hashCode ^
        pos.hashCode ^
        e4e.hashCode ^
        descripcion.hashCode ^
        um.hashCode ^
        ctd.hashCode ^
        entregado.hashCode ^
        porentregar.hashCode ^
        precioneto.hashCode ^
        valorneto.hashCode ^
        valorliberado.hashCode ^
        moneda.hashCode ^
        fechapedido.hashCode ^
        fechaentrega.hashCode ^
        inco.hashCode ^
        destino.hashCode ^
        tipomaterial.hashCode ^
        pagoen.hashCode ^
        proveedor.hashCode ^
        contrato.hashCode ^
        poscontrato.hashCode ^
        centro.hashCode ^
        usuario.hashCode ^
        actualizado.hashCode;
  }
}
