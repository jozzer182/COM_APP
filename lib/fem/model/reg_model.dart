import 'dart:convert';

import '../../resources/a_entero_2.dart';
import '../../resources/to_celda.dart';

class FemReg {
  String id;
  String estado;
  String estdespacho;
  String tipo;
  String fechainicial;
  String fechacambio;
  String fechasolicitud;
  String unidad;
  String codigo;
  String proyecto;
  String circuito;
  String pm;
  String solicitante;
  String pdi;
  String wbe;
  String proyectoWBE;
  String comentario1;
  String comentario2;
  String e4e;
  String descripcion;
  String um;
  String m01q1;
  String m01q2;
  String m01qx;
  String m02q1;
  String m02q2;
  String m02qx;
  String m03q1;
  String m03q2;
  String m03qx;
  String m04q1;
  String m04q2;
  String m04qx;
  String m05q1;
  String m05q2;
  String m05qx;
  String m06q1;
  String m06q2;
  String m06qx;
  String m07q1;
  String m07q2;
  String m07qx;
  String m08q1;
  String m08q2;
  String m08qx;
  String m09q1;
  String m09q2;
  String m09qx;
  String m10q1;
  String m10q2;
  String m10qx;
  String m11q1;
  String m11q2;
  String m11qx;
  String m12q1;
  String m12q2;
  String m12qx;
  FemReg({
    required this.id,
    required this.estado,
    required this.estdespacho,
    required this.tipo,
    required this.fechainicial,
    required this.fechacambio,
    required this.fechasolicitud,
    required this.unidad,
    required this.codigo,
    required this.proyecto,
    required this.circuito,
    required this.pm,
    required this.solicitante,
    required this.pdi,
    required this.wbe,
    required this.proyectoWBE,
    required this.comentario1,
    required this.comentario2,
    required this.e4e,
    required this.descripcion,
    required this.um,
    required this.m01q1,
    required this.m01q2,
    required this.m01qx,
    required this.m02q1,
    required this.m02q2,
    required this.m02qx,
    required this.m03q1,
    required this.m03q2,
    required this.m03qx,
    required this.m04q1,
    required this.m04q2,
    required this.m04qx,
    required this.m05q1,
    required this.m05q2,
    required this.m05qx,
    required this.m06q1,
    required this.m06q2,
    required this.m06qx,
    required this.m07q1,
    required this.m07q2,
    required this.m07qx,
    required this.m08q1,
    required this.m08q2,
    required this.m08qx,
    required this.m09q1,
    required this.m09q2,
    required this.m09qx,
    required this.m10q1,
    required this.m10q2,
    required this.m10qx,
    required this.m11q1,
    required this.m11q2,
    required this.m11qx,
    required this.m12q1,
    required this.m12q2,
    required this.m12qx,
  });

  List<String> toList() {
    return [
      id,
      estado,
      estdespacho,
      tipo,
      fechainicial,
      fechacambio,
      fechasolicitud,
      unidad,
      codigo,
      proyecto,
      circuito,
      pm,
      solicitante,
      pdi,
      wbe,
      proyectoWBE,
      comentario1,
      comentario2,
      e4e,
      descripcion,
      um,
      m01q1,
      m01q2,
      m01qx,
      m02q1,
      m02q2,
      m02qx,
      m03q1,
      m03q2,
      m03qx,
      m04q1,
      m04q2,
      m04qx,
      m05q1,
      m05q2,
      m05qx,
      m06q1,
      m06q2,
      m06qx,
      m07q1,
      m07q2,
      m07qx,
      m08q1,
      m08q2,
      m08qx,
      m09q1,
      m09q2,
      m09qx,
      m10q1,
      m10q2,
      m10qx,
      m11q1,
      m11q2,
      m11qx,
      m12q1,
      m12q2,
      m12qx,
    ];
  }

  FemReg copyWith({
    String? id,
    String? estado,
    String? estdespacho,
    String? tipo,
    String? fechainicial,
    String? fechacambio,
    String? fechasolicitud,
    String? unidad,
    String? codigo,
    String? proyecto,
    String? circuito,
    String? pm,
    String? solicitante,
    String? pdi,
    String? wbe,
    String? proyectoWBE,
    String? comentario1,
    String? comentario2,
    String? e4e,
    String? descripcion,
    String? um,
    String? m01q1,
    String? m01q2,
    String? m01qx,
    String? m02q1,
    String? m02q2,
    String? m02qx,
    String? m03q1,
    String? m03q2,
    String? m03qx,
    String? m04q1,
    String? m04q2,
    String? m04qx,
    String? m05q1,
    String? m05q2,
    String? m05qx,
    String? m06q1,
    String? m06q2,
    String? m06qx,
    String? m07q1,
    String? m07q2,
    String? m07qx,
    String? m08q1,
    String? m08q2,
    String? m08qx,
    String? m09q1,
    String? m09q2,
    String? m09qx,
    String? m10q1,
    String? m10q2,
    String? m10qx,
    String? m11q1,
    String? m11q2,
    String? m11qx,
    String? m12q1,
    String? m12q2,
    String? m12qx,
  }) {
    return FemReg(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      estdespacho: estdespacho ?? this.estdespacho,
      tipo: tipo ?? this.tipo,
      fechainicial: fechainicial ?? this.fechainicial,
      fechacambio: fechacambio ?? this.fechacambio,
      fechasolicitud: fechasolicitud ?? this.fechasolicitud,
      unidad: unidad ?? this.unidad,
      codigo: codigo ?? this.codigo,
      proyecto: proyecto ?? this.proyecto,
      circuito: circuito ?? this.circuito,
      pm: pm ?? this.pm,
      solicitante: solicitante ?? this.solicitante,
      pdi: pdi ?? this.pdi,
      wbe: wbe ?? this.wbe,
      proyectoWBE: proyectoWBE ?? this.proyectoWBE,
      comentario1: comentario1 ?? this.comentario1,
      comentario2: comentario2 ?? this.comentario2,
      e4e: e4e ?? this.e4e,
      descripcion: descripcion ?? this.descripcion,
      um: um ?? this.um,
      m01q1: m01q1 ?? this.m01q1,
      m01q2: m01q2 ?? this.m01q2,
      m01qx: m01qx ?? this.m01qx,
      m02q1: m02q1 ?? this.m02q1,
      m02q2: m02q2 ?? this.m02q2,
      m02qx: m02qx ?? this.m02qx,
      m03q1: m03q1 ?? this.m03q1,
      m03q2: m03q2 ?? this.m03q2,
      m03qx: m03qx ?? this.m03qx,
      m04q1: m04q1 ?? this.m04q1,
      m04q2: m04q2 ?? this.m04q2,
      m04qx: m04qx ?? this.m04qx,
      m05q1: m05q1 ?? this.m05q1,
      m05q2: m05q2 ?? this.m05q2,
      m05qx: m05qx ?? this.m05qx,
      m06q1: m06q1 ?? this.m06q1,
      m06q2: m06q2 ?? this.m06q2,
      m06qx: m06qx ?? this.m06qx,
      m07q1: m07q1 ?? this.m07q1,
      m07q2: m07q2 ?? this.m07q2,
      m07qx: m07qx ?? this.m07qx,
      m08q1: m08q1 ?? this.m08q1,
      m08q2: m08q2 ?? this.m08q2,
      m08qx: m08qx ?? this.m08qx,
      m09q1: m09q1 ?? this.m09q1,
      m09q2: m09q2 ?? this.m09q2,
      m09qx: m09qx ?? this.m09qx,
      m10q1: m10q1 ?? this.m10q1,
      m10q2: m10q2 ?? this.m10q2,
      m10qx: m10qx ?? this.m10qx,
      m11q1: m11q1 ?? this.m11q1,
      m11q2: m11q2 ?? this.m11q2,
      m11qx: m11qx ?? this.m11qx,
      m12q1: m12q1 ?? this.m12q1,
      m12q2: m12q2 ?? this.m12q2,
      m12qx: m12qx ?? this.m12qx,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'estado': estado,
      'estdespacho': estdespacho,
      'tipo': tipo,
      'fechainicial': fechainicial,
      'fechacambio': fechacambio,
      'fechasolicitud': fechasolicitud,
      'unidad': unidad,
      'codigo': codigo,
      'proyecto': proyecto,
      'circuito': circuito,
      'pm': pm,
      'solicitante': solicitante,
      'pdi': pdi,
      'wbe': wbe,
      'proyectoWBE': proyectoWBE,
      'comentario1': comentario1,
      'comentario2': comentario2,
      'e4e': e4e,
      'descripcion': descripcion,
      'um': um,
      'm01q1': m01q1,
      'm01q2': m01q2,
      'm01qx': m01qx,
      'm02q1': m02q1,
      'm02q2': m02q2,
      'm02qx': m02qx,
      'm03q1': m03q1,
      'm03q2': m03q2,
      'm03qx': m03qx,
      'm04q1': m04q1,
      'm04q2': m04q2,
      'm04qx': m04qx,
      'm05q1': m05q1,
      'm05q2': m05q2,
      'm05qx': m05qx,
      'm06q1': m06q1,
      'm06q2': m06q2,
      'm06qx': m06qx,
      'm07q1': m07q1,
      'm07q2': m07q2,
      'm07qx': m07qx,
      'm08q1': m08q1,
      'm08q2': m08q2,
      'm08qx': m08qx,
      'm09q1': m09q1,
      'm09q2': m09q2,
      'm09qx': m09qx,
      'm10q1': m10q1,
      'm10q2': m10q2,
      'm10qx': m10qx,
      'm11q1': m11q1,
      'm11q2': m11q2,
      'm11qx': m11qx,
      'm12q1': m12q1,
      'm12q2': m12q2,
      'm12qx': m12qx,
    };
  }

  factory FemReg.fromMap(Map<String, dynamic> map) {
    return FemReg(
      id: map['idnew'].toString(),
      estado: map['estado']?.toString() ?? '',
      estdespacho: map['estdespacho']?.toString() ?? '',
      tipo: map['tipo']?.toString() ?? '',
      fechainicial: map['fechainicial']?.toString() ?? '',
      fechacambio: map['fechacambio']?.toString() ?? '',
      fechasolicitud: map['fechasolicitud']?.toString() ?? '',
      unidad: map['unidad']?.toString() ?? '',
      // iden: map['iden']?.toString() ?? '',
      codigo: map['codigo']?.toString() ?? '',
      proyecto: map['proyecto']?.toString() ?? '',
      circuito: map['circuito']?.toString() ?? '',
      pm: map['pm']?.toString() ?? '',
      solicitante: map['solicitante']?.toString() ?? '',
      pdi: map['pdi']?.toString() ?? '',
      wbe: map['wbe']?.toString() ?? '',
      proyectoWBE: map['proyecto_wbe']?.toString() ?? '',
      comentario1: map['comentario1']?.toString() ?? '',
      comentario2: map['comentario2']?.toString() ?? '',
      e4e: map['e4e']?.toString() ?? '',
      descripcion: map['descripcion']?.toString() ?? '',
      um: map['um']?.toString() ?? '',
      m01q1: map['m01q1']?.toString() ?? '',
      m01q2: map['m01q2']?.toString() ?? '',
      m01qx: map['m01qx']?.toString() ?? '',
      m02q1: map['m02q1']?.toString() ?? '',
      m02q2: map['m02q2']?.toString() ?? '',
      m02qx: map['m02qx']?.toString() ?? '',
      m03q1: map['m03q1']?.toString() ?? '',
      m03q2: map['m03q2']?.toString() ?? '',
      m03qx: map['m03qx']?.toString() ?? '',
      m04q1: map['m04q1']?.toString() ?? '',
      m04q2: map['m04q2']?.toString() ?? '',
      m04qx: map['m04qx']?.toString() ?? '',
      m05q1: map['m05q1']?.toString() ?? '',
      m05q2: map['m05q2']?.toString() ?? '',
      m05qx: map['m05qx']?.toString() ?? '',
      m06q1: map['m06q1']?.toString() ?? '',
      m06q2: map['m06q2']?.toString() ?? '',
      m06qx: map['m06qx']?.toString() ?? '',
      m07q1: map['m07q1']?.toString() ?? '',
      m07q2: map['m07q2']?.toString() ?? '',
      m07qx: map['m07qx']?.toString() ?? '',
      m08q1: map['m08q1']?.toString() ?? '',
      m08q2: map['m08q2']?.toString() ?? '',
      m08qx: map['m08qx']?.toString() ?? '',
      m09q1: map['m09q1']?.toString() ?? '',
      m09q2: map['m09q2']?.toString() ?? '',
      m09qx: map['m09qx']?.toString() ?? '',
      m10q1: map['m10q1']?.toString() ?? '',
      m10q2: map['m10q2']?.toString() ?? '',
      m10qx: map['m10qx']?.toString() ?? '',
      m11q1: map['m11q1']?.toString() ?? '',
      m11q2: map['m11q2']?.toString() ?? '',
      m11qx: map['m11qx']?.toString() ?? '',
      m12q1: map['m12q1']?.toString() ?? '',
      m12q2: map['m12q2']?.toString() ?? '',
      m12qx: map['m12qx']?.toString() ?? '',
    );
  }

  factory FemReg.fromList(List ls) {
    return FemReg(
      id: ls[0].toString(),
      estado: ls[1].toString(),
      estdespacho: ls[2].toString(),
      tipo: ls[3].toString(),
      fechainicial: ls[4].toString(),
      fechacambio: ls[5].toString(),
      fechasolicitud: ls[6].toString(),
      unidad: ls[7].toString(),
      codigo: ls[8].toString(),
      proyecto: ls[9].toString(),
      circuito: ls[10].toString(),
      pm: ls[11].toString(),
      solicitante: ls[12].toString(),
      pdi: ls[13].toString(),
      wbe: ls[14].toString(),
      proyectoWBE: ls[15].toString(),
      comentario1: ls[16].toString(),
      comentario2: ls[17].toString(),
      e4e: ls[18].toString(),
      descripcion: ls[19].toString(),
      um: ls[20].toString(),
      m01q1: ls[21].toString(),
      m01q2: ls[22].toString(),
      m01qx: ls[23].toString(),
      m02q1: ls[24].toString(),
      m02q2: ls[25].toString(),
      m02qx: ls[26].toString(),
      m03q1: ls[27].toString(),
      m03q2: ls[28].toString(),
      m03qx: ls[29].toString(),
      m04q1: ls[30].toString(),
      m04q2: ls[31].toString(),
      m04qx: ls[32].toString(),
      m05q1: ls[33].toString(),
      m05q2: ls[34].toString(),
      m05qx: ls[35].toString(),
      m06q1: ls[36].toString(),
      m06q2: ls[37].toString(),
      m06qx: ls[38].toString(),
      m07q1: ls[39].toString(),
      m07q2: ls[40].toString(),
      m07qx: ls[41].toString(),
      m08q1: ls[42].toString(),
      m08q2: ls[43].toString(),
      m08qx: ls[44].toString(),
      m09q1: ls[45].toString(),
      m09q2: ls[46].toString(),
      m09qx: ls[47].toString(),
      m10q1: ls[48].toString(),
      m10q2: ls[49].toString(),
      m10qx: ls[50].toString(),
      m11q1: ls[51].toString(),
      m11q2: ls[52].toString(),
      m11qx: ls[53].toString(),
      m12q1: ls[54].toString(),
      m12q2: ls[55].toString(),
      m12qx: ls[56].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FemReg.fromJson(String source) => FemReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FemReg(id: $id, estado: $estado, estdespacho: $estdespacho, tipo: $tipo, fechainicial: $fechainicial, fechacambio: $fechacambio, fechasolicitud: $fechasolicitud, unidad: $unidad, codigo: $codigo, proyecto: $proyecto, circuito: $circuito, pm: $pm, solicitante: $solicitante, pdi: $pdi, wbe: $wbe, proyectoWBE: $proyectoWBE, comentario1: $comentario1, comentario2: $comentario2, e4e: $e4e, descripcion: $descripcion, um: $um, m01q1: $m01q1, m01q2: $m01q2, m01qx: $m01qx, m02q1: $m02q1, m02q2: $m02q2, m02qx: $m02qx, m03q1: $m03q1, m03q2: $m03q2, m03qx: $m03qx, m04q1: $m04q1, m04q2: $m04q2, m04qx: $m04qx, m05q1: $m05q1, m05q2: $m05q2, m05qx: $m05qx, m06q1: $m06q1, m06q2: $m06q2, m06qx: $m06qx, m07q1: $m07q1, m07q2: $m07q2, m07qx: $m07qx, m08q1: $m08q1, m08q2: $m08q2, m08qx: $m08qx, m09q1: $m09q1, m09q2: $m09q2, m09qx: $m09qx, m10q1: $m10q1, m10q2: $m10q2, m10qx: $m10qx, m11q1: $m11q1, m11q2: $m11q2, m11qx: $m11qx, m12q1: $m12q1, m12q2: $m12q2, m12qx: $m12qx)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FemReg &&
        other.id == id &&
        other.estado == estado &&
        other.estdespacho == estdespacho &&
        other.tipo == tipo &&
        other.fechainicial == fechainicial &&
        other.fechacambio == fechacambio &&
        other.fechasolicitud == fechasolicitud &&
        other.unidad == unidad &&
        other.codigo == codigo &&
        other.proyecto == proyecto &&
        other.circuito == circuito &&
        other.pm == pm &&
        other.solicitante == solicitante &&
        other.pdi == pdi &&
        other.wbe == wbe &&
        other.proyectoWBE == proyectoWBE &&
        other.comentario1 == comentario1 &&
        other.comentario2 == comentario2 &&
        other.e4e == e4e &&
        other.descripcion == descripcion &&
        other.um == um &&
        other.m01q1 == m01q1 &&
        other.m01q2 == m01q2 &&
        other.m01qx == m01qx &&
        other.m02q1 == m02q1 &&
        other.m02q2 == m02q2 &&
        other.m02qx == m02qx &&
        other.m03q1 == m03q1 &&
        other.m03q2 == m03q2 &&
        other.m03qx == m03qx &&
        other.m04q1 == m04q1 &&
        other.m04q2 == m04q2 &&
        other.m04qx == m04qx &&
        other.m05q1 == m05q1 &&
        other.m05q2 == m05q2 &&
        other.m05qx == m05qx &&
        other.m06q1 == m06q1 &&
        other.m06q2 == m06q2 &&
        other.m06qx == m06qx &&
        other.m07q1 == m07q1 &&
        other.m07q2 == m07q2 &&
        other.m07qx == m07qx &&
        other.m08q1 == m08q1 &&
        other.m08q2 == m08q2 &&
        other.m08qx == m08qx &&
        other.m09q1 == m09q1 &&
        other.m09q2 == m09q2 &&
        other.m09qx == m09qx &&
        other.m10q1 == m10q1 &&
        other.m10q2 == m10q2 &&
        other.m10qx == m10qx &&
        other.m11q1 == m11q1 &&
        other.m11q2 == m11q2 &&
        other.m11qx == m11qx &&
        other.m12q1 == m12q1 &&
        other.m12q2 == m12q2 &&
        other.m12qx == m12qx;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        estado.hashCode ^
        estdespacho.hashCode ^
        tipo.hashCode ^
        fechainicial.hashCode ^
        fechacambio.hashCode ^
        fechasolicitud.hashCode ^
        unidad.hashCode ^
        codigo.hashCode ^
        proyecto.hashCode ^
        circuito.hashCode ^
        pm.hashCode ^
        solicitante.hashCode ^
        pdi.hashCode ^
        wbe.hashCode ^
        proyectoWBE.hashCode ^
        comentario1.hashCode ^
        comentario2.hashCode ^
        e4e.hashCode ^
        descripcion.hashCode ^
        um.hashCode ^
        m01q1.hashCode ^
        m01q2.hashCode ^
        m01qx.hashCode ^
        m02q1.hashCode ^
        m02q2.hashCode ^
        m02qx.hashCode ^
        m03q1.hashCode ^
        m03q2.hashCode ^
        m03qx.hashCode ^
        m04q1.hashCode ^
        m04q2.hashCode ^
        m04qx.hashCode ^
        m05q1.hashCode ^
        m05q2.hashCode ^
        m05qx.hashCode ^
        m06q1.hashCode ^
        m06q2.hashCode ^
        m06qx.hashCode ^
        m07q1.hashCode ^
        m07q2.hashCode ^
        m07qx.hashCode ^
        m08q1.hashCode ^
        m08q2.hashCode ^
        m08qx.hashCode ^
        m09q1.hashCode ^
        m09q2.hashCode ^
        m09qx.hashCode ^
        m10q1.hashCode ^
        m10q2.hashCode ^
        m10qx.hashCode ^
        m11q1.hashCode ^
        m11q2.hashCode ^
        m11qx.hashCode ^
        m12q1.hashCode ^
        m12q2.hashCode ^
        m12qx.hashCode;
  }

  int get ano => int.parse(id.substring(0, 4));
  int get m01 => aEntero(m01q1) + aEntero(m01q2) + aEntero(m01qx);
  int get m02 => aEntero(m02q1) + aEntero(m02q2) + aEntero(m02qx);
  int get m03 => aEntero(m03q1) + aEntero(m03q2) + aEntero(m03qx);
  int get m04 => aEntero(m04q1) + aEntero(m04q2) + aEntero(m04qx);
  int get m05 => aEntero(m05q1) + aEntero(m05q2) + aEntero(m05qx);
  int get m06 => aEntero(m06q1) + aEntero(m06q2) + aEntero(m06qx);
  int get m07 => aEntero(m07q1) + aEntero(m07q2) + aEntero(m07qx);
  int get m08 => aEntero(m08q1) + aEntero(m08q2) + aEntero(m08qx);
  int get m09 => aEntero(m09q1) + aEntero(m09q2) + aEntero(m09qx);
  int get m10 => aEntero(m10q1) + aEntero(m10q2) + aEntero(m10qx);
  int get m11 => aEntero(m11q1) + aEntero(m11q2) + aEntero(m11qx);
  int get m12 => aEntero(m12q1) + aEntero(m12q2) + aEntero(m12qx);
  int get total =>
      m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11 + m12;

  num mes(int month) {
    if (month == 1) return m01;
    if (month == 2) return m02;
    if (month == 3) return m03;
    if (month == 4) return m04;
    if (month == 5) return m05;
    if (month == 6) return m06;
    if (month == 7) return m07;
    if (month == 8) return m08;
    if (month == 9) return m09;
    if (month == 10) return m10;
    if (month == 11) return m11;
    if (month == 12) return m12;
    return 0;
  }

  List<ToCelda> get celdas => [
        ToCelda(valor: id, flex: 2),
        ToCelda(valor: '$ano', flex: 2),
        ToCelda(valor: unidad, flex: 2),
        ToCelda(valor: proyecto, flex: 6),
        ToCelda(valor: pm, flex: 2),
        ToCelda(valor: solicitante, flex: 2),
        ToCelda(valor: e4e, flex: 2),
        ToCelda(valor: descripcion, flex: 6),
        ToCelda(valor: '$m01', flex: 1),
        ToCelda(valor: '$m02', flex: 1),
        ToCelda(valor: '$m03', flex: 1),
        ToCelda(valor: '$m04', flex: 1),
        ToCelda(valor: '$m05', flex: 1),
        ToCelda(valor: '$m06', flex: 1),
        ToCelda(valor: '$m07', flex: 1),
        ToCelda(valor: '$m08', flex: 1),
        ToCelda(valor: '$m09', flex: 1),
        ToCelda(valor: '$m10', flex: 1),
        ToCelda(valor: '$m11', flex: 1),
        ToCelda(valor: '$m12', flex: 1),
        ToCelda(valor: '$total', flex: 1),
      ];

  String get mesesCambios {
    String year = id.substring(0, 4);
    String meses = '';
    for (int i = 1; i <= 12; i++) {
      if (mes(i) > 0) {
        meses += '$i/$year, ';
      }
    }
    return meses;
  }

  num get ctdAno{
    int esteAno = DateTime.now().year;
    int proxAno = esteAno + 1;
    int esteMes = DateTime.now().month + 1;
    num ctd = 0;
    int year = aEntero(id.substring(0, 4));
    int mesInicio = year == esteAno ? esteMes : 1;
    int mesFin = year == proxAno ? esteMes : 12;
    for (int month = mesInicio; month <= mesFin; month++) {
      ctd += mes(month);
    }
    return ctd;
  }
}
