import 'dart:convert';

import 'reg_enum.dart';

class PreordenReg {
  String id;
  String preorden;
  String pos;
  String proyecto;
  String pm;
  String portfolio;
  String e4e;
  String descripcion;
  String um;
  String ctd;
  String precio;
  String moneda;
  String femid;
  String femctd;
  String femfecha;
  String femobservacion;
  String contrato;
  String gestor;
  String wbe;
  String proyectowbe;
  String status;
  String observaciongeneral;
  String creadofecha;
  String creadopersona;
  String creadocomentario;
  String confirmadofecha;
  String confirmadopersona;
  String confirmadocomentario;
  String generadofecha;
  String generadopersona;
  String generadocomentario;
  String oda;
  String odapos;
  String odafecha;
  String odapersona;
  String odacomentario;
  String estado;
  String fecha;
  String persona;
  String enviadopm;
  String enviadogestor;
  PreordenReg({
    required this.id,
    required this.preorden,
    required this.pos,
    required this.proyecto,
    required this.pm,
    required this.portfolio,
    required this.e4e,
    required this.descripcion,
    required this.um,
    required this.ctd,
    required this.precio,
    required this.moneda,
    required this.femid,
    required this.femctd,
    required this.femfecha,
    required this.femobservacion,
    required this.contrato,
    required this.gestor,
    required this.wbe,
    required this.proyectowbe,
    required this.status,
    required this.observaciongeneral,
    required this.creadofecha,
    required this.creadopersona,
    required this.creadocomentario,
    required this.confirmadofecha,
    required this.confirmadopersona,
    required this.confirmadocomentario,
    required this.generadofecha,
    required this.generadopersona,
    required this.generadocomentario,
    required this.oda,
    required this.odapos,
    required this.odafecha,
    required this.odapersona,
    required this.odacomentario,
    required this.estado,
    required this.fecha,
    required this.persona,
    required this.enviadopm,
    required this.enviadogestor,
  });

  List<String> toList() {
    return [
      id,
      preorden,
      pos,
      proyecto,
      pm,
      portfolio,
      e4e,
      descripcion,
      um,
      ctd,
      precio,
      moneda,
      femid,
      femctd,
      femfecha,
      femobservacion,
      contrato,
      gestor,
      wbe,
      proyectowbe,
      status,
      observaciongeneral,
      creadofecha,
      creadopersona,
      creadocomentario,
      confirmadofecha,
      confirmadopersona,
      confirmadocomentario,
      generadofecha,
      generadopersona,
      generadocomentario,
      oda,
      odapos,
      odafecha,
      odapersona,
      odacomentario,
      estado,
      fecha,
      persona,
      enviadopm,
      enviadogestor,
    ];
  }

  PreordenReg copyWith({
    String? id,
    String? preorden,
    String? pos,
    String? proyecto,
    String? pm,
    String? portfolio,
    String? e4e,
    String? descripcion,
    String? um,
    String? ctd,
    String? precio,
    String? moneda,
    String? femid,
    String? femctd,
    String? femfecha,
    String? femobservacion,
    String? contrato,
    String? gestor,
    String? wbe,
    String? proyectowbe,
    String? status,
    String? observaciongeneral,
    String? creadofecha,
    String? creadopersona,
    String? creadocomentario,
    String? confirmadofecha,
    String? confirmadopersona,
    String? confirmadocomentario,
    String? generadofecha,
    String? generadopersona,
    String? generadocomentario,
    String? oda,
    String? odapos,
    String? odafecha,
    String? odapersona,
    String? odacomentario,
    String? estado,
    String? fecha,
    String? persona,
    String? enviadopm,
    String? enviadogestor,
  }) {
    return PreordenReg(
      id: id ?? this.id,
      preorden: preorden ?? this.preorden,
      pos: pos ?? this.pos,
      proyecto: proyecto ?? this.proyecto,
      pm: pm ?? this.pm,
      portfolio: portfolio ?? this.portfolio,
      e4e: e4e ?? this.e4e,
      descripcion: descripcion ?? this.descripcion,
      um: um ?? this.um,
      ctd: ctd ?? this.ctd,
      precio: precio ?? this.precio,
      moneda: moneda ?? this.moneda,
      femid: femid ?? this.femid,
      femctd: femctd ?? this.femctd,
      femfecha: femfecha ?? this.femfecha,
      femobservacion: femobservacion ?? this.femobservacion,
      contrato: contrato ?? this.contrato,
      gestor: gestor ?? this.gestor,
      wbe: wbe ?? this.wbe,
      proyectowbe: proyectowbe ?? this.proyectowbe,
      status: status ?? this.status,
      observaciongeneral: observaciongeneral ?? this.observaciongeneral,
      creadofecha: creadofecha ?? this.creadofecha,
      creadopersona: creadopersona ?? this.creadopersona,
      creadocomentario: creadocomentario ?? this.creadocomentario,
      confirmadofecha: confirmadofecha ?? this.confirmadofecha,
      confirmadopersona: confirmadopersona ?? this.confirmadopersona,
      confirmadocomentario: confirmadocomentario ?? this.confirmadocomentario,
      generadofecha: generadofecha ?? this.generadofecha,
      generadopersona: generadopersona ?? this.generadopersona,
      generadocomentario: generadocomentario ?? this.generadocomentario,
      oda: oda ?? this.oda,
      odapos: odapos ?? this.odapos,
      odafecha: odafecha ?? this.odafecha,
      odapersona: odapersona ?? this.odapersona,
      odacomentario: odacomentario ?? this.odacomentario,
      estado: estado ?? this.estado,
      fecha: fecha ?? this.fecha,
      persona: persona ?? this.persona,
      enviadopm: enviadopm ?? this.enviadopm,
      enviadogestor: enviadogestor ?? this.enviadogestor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'preorden': preorden,
      'pos': pos,
      'proyecto': proyecto,
      'pm': pm,
      'portfolio': portfolio,
      'e4e': e4e,
      'descripcion': descripcion,
      'um': um,
      'ctd': ctd,
      'precio': precio,
      'moneda': moneda,
      'femid': femid,
      'femctd': femctd,
      'femfecha': femfecha,
      'femobservacion': femobservacion,
      'contrato': contrato,
      'gestor': gestor,
      'wbe': wbe,
      'proyectowbe': proyectowbe,
      'status': status,
      'observaciongeneral': observaciongeneral,
      'creadofecha': creadofecha,
      'creadopersona': creadopersona,
      'creadocomentario': creadocomentario,
      'confirmadofecha': confirmadofecha,
      'confirmadopersona': confirmadopersona,
      'confirmadocomentario': confirmadocomentario,
      'generadofecha': generadofecha,
      'generadopersona': generadopersona,
      'generadocomentario': generadocomentario,
      'oda': oda,
      'odapos': odapos,
      'odafecha': odafecha,
      'odapersona': odapersona,
      'odacomentario': odacomentario,
      'estado': estado,
      'fecha': fecha,
      'persona': persona,
      'enviadopm': enviadopm,
      'enviadogestor': enviadogestor,
    };
  }

  factory PreordenReg.fromMap(Map<String, dynamic> map) {
    return PreordenReg(
      id: map['id'].toString(),
      preorden: map['preorden'].toString(),
      pos: map['pos'].toString(),
      proyecto: map['proyecto'].toString(),
      pm: map['pm'].toString(),
      portfolio: map['portfolio'].toString(),
      e4e: map['e4e'].toString(),
      descripcion: map['descripcion'].toString(),
      um: map['um'].toString(),
      ctd: map['ctd'].toString(),
      precio: map['precio'].toString(),
      moneda: map['moneda'].toString(),
      femid: map['femid'].toString(),
      femctd: map['femctd'].toString(),
      femfecha: map['femfecha'].toString(),
      femobservacion: map['femobservacion'].toString(),
      contrato: map['contrato'].toString(),
      gestor: map['gestor'].toString(),
      wbe: map['wbe'].toString(),
      proyectowbe: map['proyectowbe'].toString(),
      status: map['status'].toString(),
      observaciongeneral: map['observaciongeneral'].toString(),
      creadofecha: map['creadofecha'].toString(),
      creadopersona: map['creadopersona'].toString(),
      creadocomentario: map['creadocomentario'].toString(),
      confirmadofecha: map['confirmadofecha'].toString(),
      confirmadopersona: map['confirmadopersona'].toString(),
      confirmadocomentario: map['confirmadocomentario'].toString(),
      generadofecha: map['generadofecha'].toString(),
      generadopersona: map['generadopersona'].toString(),
      generadocomentario: map['generadocomentario'].toString(),
      oda: map['oda'].toString(),
      odapos: map['odapos'].toString(),
      odafecha: map['odafecha'].toString(),
      odapersona: map['odapersona'].toString(),
      odacomentario: map['odacomentario'].toString(),
      estado: map['estado'].toString(),
      fecha: map['fecha'].toString(),
      persona: map['persona'].toString(),
      enviadopm: map['enviadopm'].toString(),
      enviadogestor: map['enviadogestor'].toString(),
    );
  }

  factory PreordenReg.fromInit(int pos) {
    return PreordenReg(
      id: '',
      preorden: '',
      pos: '$pos',
      proyecto: '',
      pm: '',
      portfolio: '',
      e4e: '',
      descripcion: '',
      um: '',
      ctd: '',
      precio: '',
      moneda: '',
      femid: '',
      femctd: '',
      femfecha: '',
      femobservacion: '',
      contrato: '',
      gestor: '',
      wbe: '',
      proyectowbe: '',
      status: '',
      observaciongeneral: '',
      creadofecha: '',
      creadopersona: '',
      creadocomentario: '',
      confirmadofecha: '',
      confirmadopersona: '',
      confirmadocomentario: '',
      generadofecha: '',
      generadopersona: '',
      generadocomentario: '',
      oda: '',
      odapos: '',
      odafecha: '',
      odapersona: '',
      odacomentario: '',
      estado: '',
      fecha: '',
      persona: '',
      enviadopm: '',
      enviadogestor: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PreordenReg.fromJson(String source) =>
      PreordenReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PreordenReg(id: $id, preorden: $preorden, pos: $pos, proyecto: $proyecto, pm: $pm, portfolio: $portfolio, e4e: $e4e, descripcion: $descripcion, um: $um, ctd: $ctd, precio: $precio, moneda: $moneda, femid: $femid, femctd: $femctd, femfecha: $femfecha, femobservacion: $femobservacion, contrato: $contrato, gestor: $gestor, wbe: $wbe, proyectowbe: $proyectowbe, status: $status, observaciongeneral: $observaciongeneral, creadofecha: $creadofecha, creadopersona: $creadopersona, creadocomentario: $creadocomentario, confirmadofecha: $confirmadofecha, confirmadopersona: $confirmadopersona, confirmadocomentario: $confirmadocomentario, generadofecha: $generadofecha, generadopersona: $generadopersona, generadocomentario: $generadocomentario, oda: $oda, odapos: $odapos, odafecha: $odafecha, odapersona: $odapersona, odacomentario: $odacomentario, estado: $estado, fecha: $fecha, persona: $persona)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PreordenReg &&
        other.id == id &&
        other.preorden == preorden &&
        other.pos == pos &&
        other.proyecto == proyecto &&
        other.pm == pm &&
        other.portfolio == portfolio &&
        other.e4e == e4e &&
        other.descripcion == descripcion &&
        other.um == um &&
        other.ctd == ctd &&
        other.precio == precio &&
        other.moneda == moneda &&
        other.femid == femid &&
        other.femctd == femctd &&
        other.femfecha == femfecha &&
        other.femobservacion == femobservacion &&
        other.contrato == contrato &&
        other.gestor == gestor &&
        other.wbe == wbe &&
        other.proyectowbe == proyectowbe &&
        other.status == status &&
        other.observaciongeneral == observaciongeneral &&
        other.creadofecha == creadofecha &&
        other.creadopersona == creadopersona &&
        other.creadocomentario == creadocomentario &&
        other.confirmadofecha == confirmadofecha &&
        other.confirmadopersona == confirmadopersona &&
        other.confirmadocomentario == confirmadocomentario &&
        other.generadofecha == generadofecha &&
        other.generadopersona == generadopersona &&
        other.generadocomentario == generadocomentario &&
        other.oda == oda &&
        other.odapos == odapos &&
        other.odafecha == odafecha &&
        other.odapersona == odapersona &&
        other.odacomentario == odacomentario &&
        other.estado == estado &&
        other.fecha == fecha &&
        other.persona == persona &&
        other.enviadopm == enviadopm &&
        other.enviadogestor == enviadogestor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        preorden.hashCode ^
        pos.hashCode ^
        proyecto.hashCode ^
        pm.hashCode ^
        portfolio.hashCode ^
        e4e.hashCode ^
        descripcion.hashCode ^
        um.hashCode ^
        ctd.hashCode ^
        precio.hashCode ^
        moneda.hashCode ^
        femid.hashCode ^
        femctd.hashCode ^
        femfecha.hashCode ^
        femobservacion.hashCode ^
        contrato.hashCode ^
        gestor.hashCode ^
        wbe.hashCode ^
        proyectowbe.hashCode ^
        status.hashCode ^
        observaciongeneral.hashCode ^
        creadofecha.hashCode ^
        creadopersona.hashCode ^
        creadocomentario.hashCode ^
        confirmadofecha.hashCode ^
        confirmadopersona.hashCode ^
        confirmadocomentario.hashCode ^
        generadofecha.hashCode ^
        generadopersona.hashCode ^
        generadocomentario.hashCode ^
        oda.hashCode ^
        odapos.hashCode ^
        odafecha.hashCode ^
        odapersona.hashCode ^
        odacomentario.hashCode ^
        estado.hashCode ^
        fecha.hashCode ^
        persona.hashCode ^
        enviadopm.hashCode ^
        enviadogestor.hashCode;
  }

  void asignar({
    required CampoPreorden campo,
    required String valor,
  }) {
    if (campo == CampoPreorden.id) id = valor;
    if (campo == CampoPreorden.preorden) preorden = valor;
    if (campo == CampoPreorden.pos) pos = valor;
    if (campo == CampoPreorden.proyecto) proyecto = valor;
    if (campo == CampoPreorden.pm) pm = valor;
    if (campo == CampoPreorden.portfolio) portfolio = valor;
    if (campo == CampoPreorden.e4e) e4e = valor;
    if (campo == CampoPreorden.descripcion) descripcion = valor;
    if (campo == CampoPreorden.um) um = valor;
    if (campo == CampoPreorden.ctd) ctd = valor;
    if (campo == CampoPreorden.precio) precio = valor;
    if (campo == CampoPreorden.moneda) moneda = valor;
    if (campo == CampoPreorden.femid) femid = valor;
    if (campo == CampoPreorden.femctd) femctd = valor;
    if (campo == CampoPreorden.femfecha) femfecha = valor;
    if (campo == CampoPreorden.femobservacion) femobservacion = valor;
    if (campo == CampoPreorden.contrato) contrato = valor;
    if (campo == CampoPreorden.gestor) gestor = valor;
    if (campo == CampoPreorden.wbe) wbe = valor;
    if (campo == CampoPreorden.proyectowbe) proyectowbe = valor;
    if (campo == CampoPreorden.status) status = valor;
    if (campo == CampoPreorden.observaciongeneral) observaciongeneral = valor;
    if (campo == CampoPreorden.creadofecha) creadofecha = valor;
    if (campo == CampoPreorden.creadopersona) creadopersona = valor;
    if (campo == CampoPreorden.creadocomentario) creadocomentario = valor;
    if (campo == CampoPreorden.confirmadofecha) confirmadofecha = valor;
    if (campo == CampoPreorden.confirmadopersona) confirmadopersona = valor;
    if (campo == CampoPreorden.confirmadocomentario) {
      confirmadocomentario = valor;
    }
    if (campo == CampoPreorden.generadofecha) generadofecha = valor;
    if (campo == CampoPreorden.generadopersona) generadopersona = valor;
    if (campo == CampoPreorden.generadocomentario) generadocomentario = valor;
    if (campo == CampoPreorden.oda) oda = valor;
    if (campo == CampoPreorden.odapos) odapos = valor;
    if (campo == CampoPreorden.odafecha) odafecha = valor;
    if (campo == CampoPreorden.odapersona) odapersona = valor;
    if (campo == CampoPreorden.odacomentario) odacomentario = valor;
    if (campo == CampoPreorden.estado) estado = valor;
    if (campo == CampoPreorden.fecha) fecha = valor;
    if (campo == CampoPreorden.persona) persona = valor;
    if (campo == CampoPreorden.enviadopm) enviadopm = valor;
    if (campo == CampoPreorden.enviadogestor) enviadogestor = valor;
  }
}
