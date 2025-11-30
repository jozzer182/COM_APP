import 'dart:convert';

import 'package:intl/intl.dart';

import '../../resources/to_celda.dart';

class ListadoPosicionesFila {
  String contrato;
  int pos;
  String e4e;
  String descripcion;
  String um;
  num ctd;
  num precioneto;
  num valorbruto;
  num ctdenordenes;
  int plazoentrega;
  String tipomaterial;
  String solicitante;
  String centro;
  DateTime actualizado;
  ListadoPosicionesFila({
    required this.contrato,
    required this.pos,
    required this.e4e,
    required this.descripcion,
    required this.um,
    required this.ctd,
    required this.precioneto,
    required this.valorbruto,
    required this.ctdenordenes,
    required this.plazoentrega,
    required this.tipomaterial,
    required this.solicitante,
    required this.centro,
    required this.actualizado,
  });

  List<String> toList() {
    NumberFormat currencyFormat =
        NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    return [
      contrato,
      pos.toString(),
      e4e,
      descripcion,
      um,
      ctd.toString(),
      currencyFormat.format(precioneto),
      currencyFormat.format(valorbruto),
      ctdenordenes.toString(),
      plazoentrega.toString(),
      tipomaterial,
      solicitante,
      centro,
      actualizado.toString(),
    ];
  }

  List<ToCelda> get celdas {
    // DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    NumberFormat currencyFormat =
        NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    // if(moneda == 'COP') currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    // if(moneda == 'USD') currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    return [
      ToCelda(valor: contrato, flex: 2),
      ToCelda(valor: pos.toString(), flex: 1),
      ToCelda(valor: e4e, flex: 2),
      ToCelda(valor: descripcion, flex: 4),
      ToCelda(valor: um, flex: 1),
      ToCelda(valor: ctd.toString(), flex: 2),
      ToCelda(valor: currencyFormat.format(precioneto), flex: 2),
      ToCelda(valor: currencyFormat.format(valorbruto), flex: 2),
      ToCelda(valor: ctdenordenes.toString(), flex: 2),
      ToCelda(valor: plazoentrega.toString(), flex: 1),
      ToCelda(valor: tipomaterial, flex: 1),
      ToCelda(valor: solicitante, flex: 1),
      ToCelda(valor: centro, flex: 1),
    ];
  }

  ListadoPosicionesFila copyWith({
    String? contrato,
    int? pos,
    String? e4e,
    String? descripcion,
    String? um,
    num? ctd,
    num? precioneto,
    num? valorbruto,
    num? ctdenordenes,
    int? plazoentrega,
    String? tipomaterial,
    String? solicitante,
    String? centro,
    DateTime? actualizado,
  }) {
    return ListadoPosicionesFila(
      contrato: contrato ?? this.contrato,
      pos: pos ?? this.pos,
      e4e: e4e ?? this.e4e,
      descripcion: descripcion ?? this.descripcion,
      um: um ?? this.um,
      ctd: ctd ?? this.ctd,
      precioneto: precioneto ?? this.precioneto,
      valorbruto: valorbruto ?? this.valorbruto,
      ctdenordenes: ctdenordenes ?? this.ctdenordenes,
      plazoentrega: plazoentrega ?? this.plazoentrega,
      tipomaterial: tipomaterial ?? this.tipomaterial,
      solicitante: solicitante ?? this.solicitante,
      centro: centro ?? this.centro,
      actualizado: actualizado ?? this.actualizado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contrato': contrato,
      'pos': pos,
      'e4e': e4e,
      'descripcion': descripcion,
      'um': um,
      'ctd': ctd,
      'precioneto': precioneto,
      'valorbruto': valorbruto,
      'ctdenordenes': ctdenordenes,
      'plazoentrega': plazoentrega,
      'tipomaterial': tipomaterial,
      'solicitante': solicitante,
      'centro': centro,
      'actualizado': actualizado.millisecondsSinceEpoch,
    };
  }

  factory ListadoPosicionesFila.fromMap(Map<String, dynamic> map) {
    DateFormat format = DateFormat('dd/M/yyyy, hh:mm:ss a', 'es');
    return ListadoPosicionesFila(
      contrato: map['contrato'].toString(),
      pos: map['pos']?.toInt() ?? 0,
      e4e: map['e4e'].toString(),
      descripcion: map['descripcion'].toString(),
      um: map['um'].toString(),
      ctd: map['ctd'] ?? 0,
      precioneto: map['precioneto'] ?? 0,
      valorbruto: map['valorbruto'] ?? 0,
      ctdenordenes: map['ctdenordenes'] ?? 0,
      plazoentrega: map['plazoentrega']?.toInt() ?? 0,
      tipomaterial: map['tipomaterial'].toString(),
      solicitante: map['solicitante'].toString(),
      centro: map['centro'].toString(),
      actualizado: format.parse(map['actualizado']),
    );
  }

  factory ListadoPosicionesFila.zero() {
    return ListadoPosicionesFila(
      contrato: '',
      pos: 0,
      e4e: '',
      descripcion: '',
      um: '',
      ctd: 0,
      precioneto: 0,
      valorbruto: 0,
      ctdenordenes: 0,
      plazoentrega: 0,
      tipomaterial: '',
      solicitante: '',
      centro: '',
      actualizado: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListadoPosicionesFila.fromJson(String source) =>
      ListadoPosicionesFila.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListadoPosicionesFila(contrato: $contrato, pos: $pos, e4e: $e4e, descripcion: $descripcion, um: $um, ctd: $ctd, precioneto: $precioneto, valorbruto: $valorbruto, ctdenordenes: $ctdenordenes, plazoentrega: $plazoentrega, tipomaterial: $tipomaterial, solicitante: $solicitante, centro: $centro, actualizado: $actualizado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListadoPosicionesFila &&
        other.contrato == contrato &&
        other.pos == pos &&
        other.e4e == e4e &&
        other.descripcion == descripcion &&
        other.um == um &&
        other.ctd == ctd &&
        other.precioneto == precioneto &&
        other.valorbruto == valorbruto &&
        other.ctdenordenes == ctdenordenes &&
        other.plazoentrega == plazoentrega &&
        other.tipomaterial == tipomaterial &&
        other.solicitante == solicitante &&
        other.centro == centro &&
        other.actualizado == actualizado;
  }

  @override
  int get hashCode {
    return contrato.hashCode ^
        pos.hashCode ^
        e4e.hashCode ^
        descripcion.hashCode ^
        um.hashCode ^
        ctd.hashCode ^
        precioneto.hashCode ^
        valorbruto.hashCode ^
        ctdenordenes.hashCode ^
        plazoentrega.hashCode ^
        tipomaterial.hashCode ^
        solicitante.hashCode ^
        centro.hashCode ^
        actualizado.hashCode;
  }
}
