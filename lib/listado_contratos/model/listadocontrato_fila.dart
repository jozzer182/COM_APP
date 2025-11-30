import 'dart:convert';

import 'package:intl/intl.dart';

import '../../resources/to_celda.dart';

class ListadoContratosFila {
  String contrato;
  String sintetico;
  DateTime inicio;
  DateTime fin;
  int diasrestantes;
  num valorprevisto;
  num valorneto;
  num valorrestante;
  String moneda;
  int pagoen;
  String inco;
  String destino;
  String indliberacion;
  String categoria;
  DateTime actualizado;
  ListadoContratosFila({
    required this.contrato,
    required this.sintetico,
    required this.inicio,
    required this.fin,
    required this.diasrestantes,
    required this.valorprevisto,
    required this.valorneto,
    required this.valorrestante,
    required this.moneda,
    required this.pagoen,
    required this.inco,
    required this.destino,
    required this.indliberacion,
    required this.categoria,
    required this.actualizado,
  });

  List<String> toList() {
    return [
      contrato,
      sintetico,
      inicio.toString(),
      fin.toString(),
      diasrestantes.toString(),
      valorprevisto.toString(),
      valorneto.toString(),
      valorrestante.toString(),
      moneda,
      pagoen.toString(),
      inco,
      destino,
      indliberacion,
      categoria,
      actualizado.toString(),
    ];
  }

  List<ToCelda> get celdas {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    NumberFormat currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    // if(moneda == 'COP') currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    // if(moneda == 'USD') currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'en_US');
    return [
      ToCelda(valor: contrato, flex: 2),
      ToCelda(valor: sintetico, flex: 2),
      ToCelda(valor: dateFormat.format(inicio), flex: 2),
      ToCelda(valor: dateFormat.format(fin), flex: 2),
      ToCelda(valor: diasrestantes.toString(), flex: 2),
      ToCelda(valor: currencyFormat.format(valorprevisto), flex: 2),
      ToCelda(valor: currencyFormat.format(valorneto), flex: 2),
      ToCelda(valor: currencyFormat.format(valorrestante), flex: 2),
      ToCelda(valor: moneda, flex: 2),
    ];
  }

  ListadoContratosFila copyWith({
    String? contrato,
    String? sintetico,
    DateTime? inicio,
    DateTime? fin,
    int? diasrestantes,
    num? valorprevisto,
    num? valorneto,
    num? valorrestante,
    String? moneda,
    int? pagoen,
    String? inco,
    String? destino,
    String? indliberacion,
    String? categoria,
    DateTime? actualizado,
  }) {
    return ListadoContratosFila(
      contrato: contrato ?? this.contrato,
      sintetico: sintetico ?? this.sintetico,
      inicio: inicio ?? this.inicio,
      fin: fin ?? this.fin,
      diasrestantes: diasrestantes ?? this.diasrestantes,
      valorprevisto: valorprevisto ?? this.valorprevisto,
      valorneto: valorneto ?? this.valorneto,
      valorrestante: valorrestante ?? this.valorrestante,
      moneda: moneda ?? this.moneda,
      pagoen: pagoen ?? this.pagoen,
      inco: inco ?? this.inco,
      destino: destino ?? this.destino,
      indliberacion: indliberacion ?? this.indliberacion,
      categoria: categoria ?? this.categoria,
      actualizado: actualizado ?? this.actualizado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contrato': contrato,
      'sintetico': sintetico,
      'inicio': inicio.millisecondsSinceEpoch,
      'fin': fin.millisecondsSinceEpoch,
      'diasrestantes': diasrestantes,
      'valorprevisto': valorprevisto,
      'valorneto': valorneto,
      'valorrestante': valorrestante,
      'moneda': moneda,
      'pagoen': pagoen,
      'inco': inco,
      'destino': destino,
      'indliberacion': indliberacion,
      'categoria': categoria,
      'actualizado': actualizado,
    };
  }

  factory ListadoContratosFila.fromMap(Map<String, dynamic> map) {
    DateFormat format = DateFormat('dd/M/yyyy, hh:mm:ss a', 'es');
    num valorneto = 0;
    num valorrestante = 0;
    if (map['valorneto'].runtimeType != String) {
      valorneto = map['valorneto'];
      valorrestante = map['valorrestante'];
    } else {
      valorrestante = map['valorprevisto'];
    }
    return ListadoContratosFila(
      contrato: map['contrato'].toString(),
      sintetico: map['sintetico'].toString(),
      inicio: DateTime.parse(map['inicio']),
      fin: DateTime.parse(map['fin']),
      diasrestantes: map['diasrestantes']?.toInt() ?? 0,
      valorprevisto: map['valorprevisto'] ?? 0,
      valorneto: valorneto,
      valorrestante: valorrestante,
      moneda: map['moneda'].toString(),
      pagoen: map['pagoen']?.toInt() ?? 0,
      inco: map['inco'].toString(),
      destino: map['destino'].toString(),
      indliberacion: map['indliberacion'].toString(),
      categoria: map['categoria'].toString(),
      actualizado: format.parse(map['actualizado']),
    );
  }

  factory ListadoContratosFila.zero() {
    return ListadoContratosFila(
      contrato: '',
      sintetico: '',
      inicio: DateTime.now(),
      fin: DateTime.now(),
      diasrestantes: 0,
      valorprevisto: 0,
      valorneto: 0,
      valorrestante: 0,
      moneda: '',
      pagoen: 0,
      inco: '',
      destino: '',
      indliberacion: '',
      categoria: '',
      actualizado: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListadoContratosFila.fromJson(String source) =>
      ListadoContratosFila.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListadoContratosFila(contrato: $contrato, sintetico: $sintetico, inicio: $inicio, fin: $fin, diasrestantes: $diasrestantes, valorprevisto: $valorprevisto, valorneto: $valorneto, valorrestante: $valorrestante, moneda: $moneda, pagoen: $pagoen, inco: $inco, destino: $destino, indliberacion: $indliberacion, categoria: $categoria, actualizado: $actualizado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListadoContratosFila &&
        other.contrato == contrato &&
        other.sintetico == sintetico &&
        other.inicio == inicio &&
        other.fin == fin &&
        other.diasrestantes == diasrestantes &&
        other.valorprevisto == valorprevisto &&
        other.valorneto == valorneto &&
        other.valorrestante == valorrestante &&
        other.moneda == moneda &&
        other.pagoen == pagoen &&
        other.inco == inco &&
        other.destino == destino &&
        other.indliberacion == indliberacion &&
        other.categoria == categoria &&
        other.actualizado == actualizado;
  }

  @override
  int get hashCode {
    return contrato.hashCode ^
        sintetico.hashCode ^
        inicio.hashCode ^
        fin.hashCode ^
        diasrestantes.hashCode ^
        valorprevisto.hashCode ^
        valorneto.hashCode ^
        valorrestante.hashCode ^
        moneda.hashCode ^
        pagoen.hashCode ^
        inco.hashCode ^
        destino.hashCode ^
        indliberacion.hashCode ^
        categoria.hashCode ^
        actualizado.hashCode;
  }
}
