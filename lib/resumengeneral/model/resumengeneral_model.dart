import 'dart:convert';

import 'package:com/resources/toCurrency.dart';
import 'package:com/resources/to_celda.dart';
import 'package:flutter/material.dart';

import '../../resources/en_millon.dart';

class ResumenGeneral {
  List<ResumenGeneralSingle> resumenGeneralList = [];

  List<ToCelda> titles = [
    ToCelda(valor: 'Proveedor', flex: 5),
    ToCelda(valor: 'Proyecto', flex: 5),
    ToCelda(valor: 'Enero', flex: 2),
    ToCelda(valor: 'Febrero', flex: 2),
    ToCelda(valor: 'Marzo', flex: 2),
    ToCelda(valor: 'Abril', flex: 2),
    ToCelda(valor: 'Mayo', flex: 2),
    ToCelda(valor: 'Junio', flex: 2),
    ToCelda(valor: 'Julio', flex: 2),
    ToCelda(valor: 'Agosto', flex: 2),
    ToCelda(valor: 'Septiembre', flex: 2),
    ToCelda(valor: 'Octubre', flex: 2),
    ToCelda(valor: 'Noviembre', flex: 2),
    ToCelda(valor: 'Diciembre', flex: 2),
    ToCelda(valor: 'Total', flex: 2),
  ];
}

class ResumenGeneralSingle {
  String proveedor;
  String proyecto;
  num m01;
  num m02;
  num m03;
  num m04;
  num m05;
  num m06;
  num m07;
  num m08;
  num m09;
  num m10;
  num m11;
  num m12;
  ResumenGeneralSingle({
    required this.proveedor,
    required this.proyecto,
    required this.m01,
    required this.m02,
    required this.m03,
    required this.m04,
    required this.m05,
    required this.m06,
    required this.m07,
    required this.m08,
    required this.m09,
    required this.m10,
    required this.m11,
    required this.m12,
  });

  ResumenGeneralSingle copyWith({
    String? proveedor,
    String? proyecto,
    num? m01,
    num? m02,
    num? m03,
    num? m04,
    num? m05,
    num? m06,
    num? m07,
    num? m08,
    num? m09,
    num? m10,
    num? m11,
    num? m12,
  }) {
    return ResumenGeneralSingle(
      proveedor: proveedor ?? this.proveedor,
      proyecto: proyecto ?? this.proyecto,
      m01: m01 ?? this.m01,
      m02: m02 ?? this.m02,
      m03: m03 ?? this.m03,
      m04: m04 ?? this.m04,
      m05: m05 ?? this.m05,
      m06: m06 ?? this.m06,
      m07: m07 ?? this.m07,
      m08: m08 ?? this.m08,
      m09: m09 ?? this.m09,
      m10: m10 ?? this.m10,
      m11: m11 ?? this.m11,
      m12: m12 ?? this.m12,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Proyecto': proyecto,
      'Proveedor': proveedorCorregido,
      'Enero': m01 == 0 ? "" : enMillon(m01),
      'Febrero': m02 == 0 ? "" : enMillon(m02),
      'Marzo': m03 == 0 ? "" : enMillon(m03),
      'Abril': m04 == 0 ? "" : enMillon(m04),
      'Mayo': m05 == 0 ? "" : enMillon(m05),
      'Junio': m06 == 0 ? "" : enMillon(m06),
      'Julio': m07 == 0 ? "" : enMillon(m07),
      'Agosto': m08 == 0 ? "" : enMillon(m08),
      'Septiembre': m09 == 0 ? "" : enMillon(m09),
      'Octubre': m10 == 0 ? "" : enMillon(m10),
      'Noviembre': m11 == 0 ? "" : enMillon(m11),
      'Diciembre': m12 == 0 ? "" : enMillon(m12),
      'Total': total == 0 ? "" : enMillon(total),
    };
  }

  factory ResumenGeneralSingle.fromMap(Map<String, dynamic> map) {
    return ResumenGeneralSingle(
      proveedor: map['proveedor'] ?? '',
      proyecto: map['proyecto'] ?? '',
      m01: map['m01']?.tonum() ?? 0,
      m02: map['m02']?.tonum() ?? 0,
      m03: map['m03']?.tonum() ?? 0,
      m04: map['m04']?.tonum() ?? 0,
      m05: map['m05']?.tonum() ?? 0,
      m06: map['m06']?.tonum() ?? 0,
      m07: map['m07']?.tonum() ?? 0,
      m08: map['m08']?.tonum() ?? 0,
      m09: map['m09']?.tonum() ?? 0,
      m10: map['m10']?.tonum() ?? 0,
      m11: map['m11']?.tonum() ?? 0,
      m12: map['m12']?.tonum() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResumenGeneralSingle.fromJson(String source) =>
      ResumenGeneralSingle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResumenGeneral(proveedor: $proveedor, proyecto: $proyecto, m01: $m01, m02: $m02, m03: $m03, m04: $m04, m05: $m05, m06: $m06, m07: $m07, m08: $m08, m09: $m09, m10: $m10, m11: $m11, m12: $m12)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResumenGeneralSingle &&
        other.proyecto == proyecto &&
        other.m01 == m01 &&
        other.m02 == m02 &&
        other.m03 == m03 &&
        other.m04 == m04 &&
        other.m05 == m05 &&
        other.m06 == m06 &&
        other.m07 == m07 &&
        other.m08 == m08 &&
        other.m09 == m09 &&
        other.m10 == m10 &&
        other.m11 == m11 &&
        other.m12 == m12;
  }

  // @override
  // num get hashCode {
  //   return proveedor.hashCode ^
  //       m01.hashCode ^
  //       m02.hashCode ^
  //       m03.hashCode ^
  //       m04.hashCode ^
  //       m05.hashCode ^
  //       m06.hashCode ^
  //       m07.hashCode ^
  //       m08.hashCode ^
  //       m09.hashCode ^
  //       m10.hashCode ^
  //       m11.hashCode ^
  //       m12.hashCode;
  // }

  void setByMes(num mes, num value) {
    if (mes == 1) m01 += value;
    if (mes == 2) m02 += value;
    if (mes == 3) m03 += value;
    if (mes == 4) m04 += value;
    if (mes == 5) m05 += value;
    if (mes == 6) m06 += value;
    if (mes == 7) m07 += value;
    if (mes == 8) m08 += value;
    if (mes == 9) m09 += value;
    if (mes == 10) m10 += value;
    if (mes == 11) m11 += value;
    if (mes == 12) m12 += value;
  }

  num get total =>
      m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11 + m12;

  String get proveedorCorregido {
    if (proveedor.startsWith('2')) {
      return proveedor.substring(11).toUpperCase();
    }
    return proveedor.toUpperCase();
  }

  List<ToCelda> get celdas => [
        ToCelda(valor: proveedorCorregido, flex: 5),
        ToCelda(valor: proyecto, flex: 5),
        ToCelda(
            valor: toCurrency$('${(m01 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m01 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m02 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m02 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m03 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m03 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m04 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m04 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m05 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m05 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m06 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m06 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m07 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m07 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m08 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m08 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m09 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m09 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m10 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m10 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m11 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m11 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(m12 / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: m12 == 0 ? Colors.grey[300] : null),
        ToCelda(
            valor: toCurrency$('${(total / 1000000).toStringAsFixed(0)}'),
            flex: 2,
            colorFuente: total == 0 ? Colors.grey[300] : null),
      ];
}
