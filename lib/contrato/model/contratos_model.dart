import 'dart:convert';

import 'package:http/http.dart';

import '../../resources/constants/url.dart';

class Contrato {
  List<ContratoSingle> contratoList = [];
  List<ContratoSingle> contratoListSearch = [];

  Future obtener() async {
    Map<String, Object> dataSend = {
      'info': {'libro': 'BD', 'hoja': 'contrato'},
      'fname': "getHoja"
    };
    final response = await post(
      Uri.parse(ApiUrl.com),
      body: jsonEncode(dataSend),
    );
    var dataAsListMap = jsonDecode(response.body);
    if (dataAsListMap.length > 0) {
      for (var item in dataAsListMap) {
        if (item["estado"] != 'anulado') {
          contratoList.add(ContratoSingle.fromMap(item));
        }
      }
    }
    contratoListSearch = [...contratoList];
    // print('contratoListSearch: $contratoListSearch');
  }
}

class ContratoSingle {
  String id;
  String documentocompras;
  String material;
  String tiempocontractualdeprimeranetregadias;
  String tiempocontractualdetcadias;
  String tipotcacontractual;
  String etcontrato;
  String versionetcontrato;
  String tendercode;
  String tiepogarantiameses;
  String estado;
  String persona;
  String fecha;
  int item = 0;
  ContratoSingle({
    required this.id,
    required this.documentocompras,
    required this.material,
    required this.tiempocontractualdeprimeranetregadias,
    required this.tiempocontractualdetcadias,
    required this.tipotcacontractual,
    required this.etcontrato,
    required this.versionetcontrato,
    required this.tendercode,
    required this.tiepogarantiameses,
    required this.estado,
    required this.persona,
    required this.fecha,
    this.item = 0,
  });

  List<String> toList() {
    return [
      id,
      documentocompras,
      material,
      tiempocontractualdeprimeranetregadias,
      tiempocontractualdetcadias,
      tipotcacontractual,
      etcontrato,
      versionetcontrato,
      tendercode,
      tiepogarantiameses,
      estado,
      persona,
      fecha,
    ];
  }

  ContratoSingle copyWith({
    String? id,
    String? documentocompras,
    String? material,
    String? tiempocontractualdeprimeranetregadias,
    String? tiempocontractualdetcadias,
    String? tipotcacontractual,
    String? etcontrato,
    String? versionetcontrato,
    String? tendercode,
    String? tiepogarantiameses,
    String? estado,
    String? persona,
    String? fecha,
  }) {
    return ContratoSingle(
      id: id ?? this.id,
      documentocompras: documentocompras ?? this.documentocompras,
      material: material ?? this.material,
      tiempocontractualdeprimeranetregadias:
          tiempocontractualdeprimeranetregadias ??
              this.tiempocontractualdeprimeranetregadias,
      tiempocontractualdetcadias:
          tiempocontractualdetcadias ?? this.tiempocontractualdetcadias,
      tipotcacontractual: tipotcacontractual ?? this.tipotcacontractual,
      etcontrato: etcontrato ?? this.etcontrato,
      versionetcontrato: versionetcontrato ?? this.versionetcontrato,
      tendercode: tendercode ?? this.tendercode,
      tiepogarantiameses: tiepogarantiameses ?? this.tiepogarantiameses,
      estado: estado ?? this.estado,
      persona: persona ?? this.persona,
      fecha: fecha ?? this.fecha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'documentocompras': documentocompras,
      'material': material,
      'tiempocontractualdeprimeranetregadias':
          tiempocontractualdeprimeranetregadias,
      'tiempocontractualdetcadias': tiempocontractualdetcadias,
      'tipotcacontractual': tipotcacontractual,
      'etcontrato': etcontrato,
      'versionetcontrato': versionetcontrato,
      'tendercode': tendercode,
      'tiepogarantiameses': tiepogarantiameses,
      'estado': estado,
      'persona': persona,
      'fecha': fecha,
    };
  }

  factory ContratoSingle.fromMap(Map<String, dynamic> map) {
    return ContratoSingle(
      id: map['id'].toString(),
      documentocompras: map['documentocompras'].toString(),
      material: map['material'].toString(),
      tiempocontractualdeprimeranetregadias:
          map['tiempocontractualdeprimeranetregadias'].toString(),
      tiempocontractualdetcadias: map['tiempocontractualdetcadias'].toString(),
      tipotcacontractual: map['tipotcacontractual'].toString(),
      etcontrato: map['etcontrato'].toString(),
      versionetcontrato: map['versionetcontrato'].toString(),
      tendercode: map['tendercode'].toString(),
      tiepogarantiameses: map['tiepogarantiameses'].toString(),
      estado: map['estado'].toString(),
      persona: map['persona'].toString(),
      fecha: map['fecha'].toString(),
    );
  }

  factory ContratoSingle.fromInit(int item, [String contrato = ""]) {
    return ContratoSingle(
      id: '',
      item: item,
      documentocompras: contrato,
      material: '',
      tiempocontractualdeprimeranetregadias: '',
      tiempocontractualdetcadias: '',
      tipotcacontractual: '',
      etcontrato: '',
      versionetcontrato: '',
      tendercode: '',
      tiepogarantiameses: '',
      estado: '',
      persona: '',
      fecha: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContratoSingle.fromJson(String source) =>
      ContratoSingle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContratoSingle(id:$id documentocompras: $documentocompras, material: $material, tiempocontractualdeprimeranetregadias: $tiempocontractualdeprimeranetregadias, tiempocontractualdetcadias: $tiempocontractualdetcadias, tipotcacontractual: $tipotcacontractual, etcontrato: $etcontrato, versionetcontrato: $versionetcontrato, tendercode: $tendercode, tiepogarantiameses: $tiepogarantiameses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContratoSingle &&
        other.documentocompras == documentocompras &&
        other.material == material &&
        other.tiempocontractualdeprimeranetregadias ==
            tiempocontractualdeprimeranetregadias &&
        other.tiempocontractualdetcadias == tiempocontractualdetcadias &&
        other.tipotcacontractual == tipotcacontractual &&
        other.etcontrato == etcontrato &&
        other.versionetcontrato == versionetcontrato &&
        other.tendercode == tendercode &&
        other.tiepogarantiameses == tiepogarantiameses;
  }

  @override
  int get hashCode {
    return documentocompras.hashCode ^
        material.hashCode ^
        tiempocontractualdeprimeranetregadias.hashCode ^
        tiempocontractualdetcadias.hashCode ^
        tipotcacontractual.hashCode ^
        etcontrato.hashCode ^
        versionetcontrato.hashCode ^
        tendercode.hashCode ^
        tiepogarantiameses.hashCode;
  }
}
