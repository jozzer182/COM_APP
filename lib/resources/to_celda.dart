import 'dart:convert';

import 'package:flutter/material.dart';

class ToCelda {
  String valor;
  int flex;
  Color? colorFuente;
  bool editar;
  String campo;
  ToCelda({
    required this.valor,
    required this.flex,
    this.colorFuente,
    this.editar = false,
    this.campo = '',
  });

  ToCelda copyWith({
    String? titulo,
    int? flex,
  }) {
    return ToCelda(
      valor: titulo ?? this.valor,
      flex: flex ?? this.flex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': valor,
      'flex': flex,
    };
  }

  factory ToCelda.fromMap(Map<String, dynamic> map) {
    return ToCelda(
      valor: map['titulo'] ?? '',
      flex: map['flex']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToCelda.fromJson(String source) =>
      ToCelda.fromMap(json.decode(source));

  @override
  String toString() => 'Titulo(titulo: $valor, flex: $flex)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToCelda && other.valor == valor && other.flex == flex;
  }

  @override
  int get hashCode => valor.hashCode ^ flex.hashCode;
}
