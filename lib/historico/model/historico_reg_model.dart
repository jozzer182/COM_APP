import 'dart:convert';

class HistoricoReg {
  String id;
  String contrato;
  String documentocompras;
  String fechadocumento;
  String proveedor;
  String proyecto;
  String bdg2024;
  String posicion;
  String material;
  String textobreve;
  String unidadmedida;
  String cantidaddepedido;
  String conformado;
  String saldo;
  String moneda;
  String precioneto;
  String valornetodepedido;
  String subtotalcop;
  String ivagastosnacionalizacion;
  String valortotalcop;
  String vrpagado;
  String valoranticipo1;
  String nopdp;
  String saldopendiente;
  String fechadeentregaincoterm;
  String fechaconformidad;
  String mesequipo;
  String mesanticipos;
  String gestor;
  String ou;
  String familia;
  String incoterm;
  String puerto;
  String wbe;
  String observaciones1;
  String observaciones2;
  String fechafirmadelcontratodecontrato;
  String fechafinalizacioncontrato;
  String fechaactadeinicio;
  String tiemposdetcadias;
  String tiemposdeentregadias;
  String fechaentregaoda;
  String fechaaprobaciondisenos;
  String hitodisenocumplido;
  String retiesino;
  String vigenciaretie;
  String fechatcacontractual;
  String fechaestimadatcacierremlm;
  String hitotcacumplido;
  String plandeproduccion;
  String fechapruebasqmlm;
  String hitopruebasqcumplido;
  String rollingtenderdeclarado;
  String rollingtenderno;
  String tiempoestimadodetransporte;
  String fechaentregaincotermactualizada;
  String hitocumplido;
  String factorivanac;
  String fechacambio;
  String personacambio;
  String estado;
  String tasa;
  String tasasap;
  HistoricoReg({
    required this.id,
    required this.contrato,
    required this.documentocompras,
    required this.fechadocumento,
    required this.proveedor,
    required this.proyecto,
    required this.bdg2024,
    required this.posicion,
    required this.material,
    required this.textobreve,
    required this.unidadmedida,
    required this.cantidaddepedido,
    required this.conformado,
    required this.saldo,
    required this.moneda,
    required this.precioneto,
    required this.valornetodepedido,
    required this.subtotalcop,
    required this.ivagastosnacionalizacion,
    required this.valortotalcop,
    required this.vrpagado,
    required this.valoranticipo1,
    required this.nopdp,
    required this.saldopendiente,
    required this.fechadeentregaincoterm,
    required this.fechaconformidad,
    required this.mesequipo,
    required this.mesanticipos,
    required this.gestor,
    required this.ou,
    required this.familia,
    required this.incoterm,
    required this.puerto,
    required this.wbe,
    required this.observaciones1,
    required this.observaciones2,
    required this.fechafirmadelcontratodecontrato,
    required this.fechafinalizacioncontrato,
    required this.fechaactadeinicio,
    required this.tiemposdetcadias,
    required this.tiemposdeentregadias,
    required this.fechaentregaoda,
    required this.fechaaprobaciondisenos,
    required this.hitodisenocumplido,
    required this.retiesino,
    required this.vigenciaretie,
    required this.fechatcacontractual,
    required this.fechaestimadatcacierremlm,
    required this.hitotcacumplido,
    required this.plandeproduccion,
    required this.fechapruebasqmlm,
    required this.hitopruebasqcumplido,
    required this.rollingtenderdeclarado,
    required this.rollingtenderno,
    required this.tiempoestimadodetransporte,
    required this.fechaentregaincotermactualizada,
    required this.hitocumplido,
    required this.factorivanac,
    required this.fechacambio,
    required this.personacambio,
    required this.estado,
    required this.tasa,
    required this.tasasap,
  });

  HistoricoReg copyWith({
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
    String? factorivanac,
    String? fechacambio,
    String? personacambio,
    String? estado,
    String? tasa,
    String? tasasap,
  }) {
    return HistoricoReg(
      id: id ?? this.id,
      contrato: contrato ?? this.contrato,
      documentocompras: documentocompras ?? this.documentocompras,
      fechadocumento: fechadocumento ?? this.fechadocumento,
      proveedor: proveedor ?? this.proveedor,
      proyecto: proyecto ?? this.proyecto,
      bdg2024: bdg2024 ?? this.bdg2024,
      posicion: posicion ?? this.posicion,
      material: material ?? this.material,
      textobreve: textobreve ?? this.textobreve,
      unidadmedida: unidadmedida ?? this.unidadmedida,
      cantidaddepedido: cantidaddepedido ?? this.cantidaddepedido,
      conformado: conformado ?? this.conformado,
      saldo: saldo ?? this.saldo,
      moneda: moneda ?? this.moneda,
      precioneto: precioneto ?? this.precioneto,
      valornetodepedido: valornetodepedido ?? this.valornetodepedido,
      subtotalcop: subtotalcop ?? this.subtotalcop,
      ivagastosnacionalizacion: ivagastosnacionalizacion ?? this.ivagastosnacionalizacion,
      valortotalcop: valortotalcop ?? this.valortotalcop,
      vrpagado: vrpagado ?? this.vrpagado,
      valoranticipo1: valoranticipo1 ?? this.valoranticipo1,
      nopdp: nopdp ?? this.nopdp,
      saldopendiente: saldopendiente ?? this.saldopendiente,
      fechadeentregaincoterm: fechadeentregaincoterm ?? this.fechadeentregaincoterm,
      fechaconformidad: fechaconformidad ?? this.fechaconformidad,
      mesequipo: mesequipo ?? this.mesequipo,
      mesanticipos: mesanticipos ?? this.mesanticipos,
      gestor: gestor ?? this.gestor,
      ou: ou ?? this.ou,
      familia: familia ?? this.familia,
      incoterm: incoterm ?? this.incoterm,
      puerto: puerto ?? this.puerto,
      wbe: wbe ?? this.wbe,
      observaciones1: observaciones1 ?? this.observaciones1,
      observaciones2: observaciones2 ?? this.observaciones2,
      fechafirmadelcontratodecontrato: fechafirmadelcontratodecontrato ?? this.fechafirmadelcontratodecontrato,
      fechafinalizacioncontrato: fechafinalizacioncontrato ?? this.fechafinalizacioncontrato,
      fechaactadeinicio: fechaactadeinicio ?? this.fechaactadeinicio,
      tiemposdetcadias: tiemposdetcadias ?? this.tiemposdetcadias,
      tiemposdeentregadias: tiemposdeentregadias ?? this.tiemposdeentregadias,
      fechaentregaoda: fechaentregaoda ?? this.fechaentregaoda,
      fechaaprobaciondisenos: fechaaprobaciondisenos ?? this.fechaaprobaciondisenos,
      hitodisenocumplido: hitodisenocumplido ?? this.hitodisenocumplido,
      retiesino: retiesino ?? this.retiesino,
      vigenciaretie: vigenciaretie ?? this.vigenciaretie,
      fechatcacontractual: fechatcacontractual ?? this.fechatcacontractual,
      fechaestimadatcacierremlm: fechaestimadatcacierremlm ?? this.fechaestimadatcacierremlm,
      hitotcacumplido: hitotcacumplido ?? this.hitotcacumplido,
      plandeproduccion: plandeproduccion ?? this.plandeproduccion,
      fechapruebasqmlm: fechapruebasqmlm ?? this.fechapruebasqmlm,
      hitopruebasqcumplido: hitopruebasqcumplido ?? this.hitopruebasqcumplido,
      rollingtenderdeclarado: rollingtenderdeclarado ?? this.rollingtenderdeclarado,
      rollingtenderno: rollingtenderno ?? this.rollingtenderno,
      tiempoestimadodetransporte: tiempoestimadodetransporte ?? this.tiempoestimadodetransporte,
      fechaentregaincotermactualizada: fechaentregaincotermactualizada ?? this.fechaentregaincotermactualizada,
      hitocumplido: hitocumplido ?? this.hitocumplido,
      factorivanac: factorivanac ?? this.factorivanac,
      fechacambio: fechacambio ?? this.fechacambio,
      personacambio: personacambio ?? this.personacambio,
      estado: estado ?? this.estado,
      tasa: tasa ?? this.tasa,
      tasasap: tasasap ?? this.tasasap,
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
      'bdg2024': bdg2024,
      'posicion': posicion,
      'material': material,
      'textobreve': textobreve,
      'unidadmedida': unidadmedida,
      'cantidaddepedido': cantidaddepedido,
      'conformado': conformado,
      'saldo': saldo,
      'moneda': moneda,
      'precioneto': precioneto,
      'valornetodepedido': valornetodepedido,
      'subtotalcop': subtotalcop,
      'ivagastosnacionalizacion': ivagastosnacionalizacion,
      'valortotalcop': valortotalcop,
      'vrpagado': vrpagado,
      'valoranticipo1': valoranticipo1,
      'nopdp': nopdp,
      'saldopendiente': saldopendiente,
      'fechadeentregaincoterm': fechadeentregaincoterm,
      'fechaconformidad': fechaconformidad,
      'mesequipo': mesequipo,
      'mesanticipos': mesanticipos,
      'gestor': gestor,
      'ou': ou,
      'familia': familia,
      'incoterm': incoterm,
      'puerto': puerto,
      'wbe': wbe,
      'observaciones1': observaciones1,
      'observaciones2': observaciones2,
      'fechafirmadelcontratodecontrato': fechafirmadelcontratodecontrato,
      'fechafinalizacioncontrato': fechafinalizacioncontrato,
      'fechaactadeinicio': fechaactadeinicio,
      'tiemposdetcadias': tiemposdetcadias,
      'tiemposdeentregadias': tiemposdeentregadias,
      'fechaentregaoda': fechaentregaoda,
      'fechaaprobaciondisenos': fechaaprobaciondisenos,
      'hitodisenocumplido': hitodisenocumplido,
      'retiesino': retiesino,
      'vigenciaretie': vigenciaretie,
      'fechatcacontractual': fechatcacontractual,
      'fechaestimadatcacierremlm': fechaestimadatcacierremlm,
      'hitotcacumplido': hitotcacumplido,
      'plandeproduccion': plandeproduccion,
      'fechapruebasqmlm': fechapruebasqmlm,
      'hitopruebasqcumplido': hitopruebasqcumplido,
      'rollingtenderdeclarado': rollingtenderdeclarado,
      'rollingtenderno': rollingtenderno,
      'tiempoestimadodetransporte': tiempoestimadodetransporte,
      'fechaentregaincotermactualizada': fechaentregaincotermactualizada,
      'hitocumplido': hitocumplido,
      'factorivanac': factorivanac,
      'fechacambio': fechacambio,
      'personacambio': personacambio,
      'estado': estado,
      'tasa': tasa,
      'tasasap': tasasap,
    };
  }

  factory HistoricoReg.fromMap(Map<String, dynamic> map) {
    return HistoricoReg(
      id: map['id'].toString(),
      contrato: map['contrato'].toString(),
      documentocompras: map['documentocompras'].toString(),
      fechadocumento: map['fechadocumento'].toString(),
      proveedor: map['proveedor'].toString(),
      proyecto: map['proyecto'].toString(),
      bdg2024: map['bdg2024'].toString(),
      posicion: map['posicion'].toString(),
      material: map['material'].toString(),
      textobreve: map['textobreve'].toString(),
      unidadmedida: map['unidadmedida'].toString(),
      cantidaddepedido: map['cantidaddepedido'].toString(),
      conformado: map['conformado'].toString(),
      saldo: map['saldo'].toString(),
      moneda: map['moneda'].toString(),
      precioneto: map['precioneto'].toString(),
      valornetodepedido: map['valornetodepedido'].toString(),
      subtotalcop: map['subtotalcop'].toString(),
      ivagastosnacionalizacion: map['ivagastosnacionalizacion'].toString(),
      valortotalcop: map['valortotalcop'].toString(),
      vrpagado: map['vrpagado'].toString(),
      valoranticipo1: map['valoranticipo1'].toString(),
      nopdp: map['nopdp'].toString(),
      saldopendiente: map['saldopendiente'].toString(),
      fechadeentregaincoterm: map['fechadeentregaincoterm'].toString(),
      fechaconformidad: map['fechaconformidad'].toString(),
      mesequipo: map['mesequipo'].toString(),
      mesanticipos: map['mesanticipos'].toString(),
      gestor: map['gestor'].toString(),
      ou: map['ou'].toString(),
      familia: map['familia'].toString(),
      incoterm: map['incoterm'].toString(),
      puerto: map['puerto'].toString(),
      wbe: map['wbe'].toString(),
      observaciones1: map['observaciones1'].toString(),
      observaciones2: map['observaciones2'].toString(),
      fechafirmadelcontratodecontrato: map['fechafirmadelcontratodecontrato'].toString(),
      fechafinalizacioncontrato: map['fechafinalizacioncontrato'].toString(),
      fechaactadeinicio: map['fechaactadeinicio'].toString(),
      tiemposdetcadias: map['tiemposdetcadias'].toString(),
      tiemposdeentregadias: map['tiemposdeentregadias'].toString(),
      fechaentregaoda: map['fechaentregaoda'].toString(),
      fechaaprobaciondisenos: map['fechaaprobaciondisenos'].toString(),
      hitodisenocumplido: map['hitodisenocumplido'].toString(),
      retiesino: map['retiesino'].toString(),
      vigenciaretie: map['vigenciaretie'].toString(),
      fechatcacontractual: map['fechatcacontractual'].toString(),
      fechaestimadatcacierremlm: map['fechaestimadatcacierremlm'].toString(),
      hitotcacumplido: map['hitotcacumplido'].toString(),
      plandeproduccion: map['plandeproduccion'].toString(),
      fechapruebasqmlm: map['fechapruebasqmlm'].toString(),
      hitopruebasqcumplido: map['hitopruebasqcumplido'].toString(),
      rollingtenderdeclarado: map['rollingtenderdeclarado'].toString(),
      rollingtenderno: map['rollingtenderno'].toString(),
      tiempoestimadodetransporte: map['tiempoestimadodetransporte'].toString(),
      fechaentregaincotermactualizada: map['fechaentregaincotermactualizada'].toString(),
      hitocumplido: map['hitocumplido'].toString(),
      factorivanac: map['factorivanac'].toString(),
      fechacambio: map['fechacambio'].toString(),
      personacambio: map['personacambio'].toString(),
      estado: map['estado'].toString(),
      tasa: map['tasa'].toString(),
      tasasap: map['tasasap'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricoReg.fromJson(String source) => HistoricoReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HistoricoReg(id: $id, contrato: $contrato, documentocompras: $documentocompras, fechadocumento: $fechadocumento, proveedor: $proveedor, proyecto: $proyecto, bdg2024: $bdg2024, posicion: $posicion, material: $material, textobreve: $textobreve, unidadmedida: $unidadmedida, cantidaddepedido: $cantidaddepedido, conformado: $conformado, saldo: $saldo, moneda: $moneda, precioneto: $precioneto, valornetodepedido: $valornetodepedido, subtotalcop: $subtotalcop, ivagastosnacionalizacion: $ivagastosnacionalizacion, valortotalcop: $valortotalcop, vrpagado: $vrpagado, valoranticipo1: $valoranticipo1, nopdp: $nopdp, saldopendiente: $saldopendiente, fechadeentregaincoterm: $fechadeentregaincoterm, fechaconformidad: $fechaconformidad, mesequipo: $mesequipo, mesanticipos: $mesanticipos, gestor: $gestor, ou: $ou, familia: $familia, incoterm: $incoterm, puerto: $puerto, wbe: $wbe, observaciones1: $observaciones1, observaciones2: $observaciones2, fechafirmadelcontratodecontrato: $fechafirmadelcontratodecontrato, fechafinalizacioncontrato: $fechafinalizacioncontrato, fechaactadeinicio: $fechaactadeinicio, tiemposdetcadias: $tiemposdetcadias, tiemposdeentregadias: $tiemposdeentregadias, fechaentregaoda: $fechaentregaoda, fechaaprobaciondisenos: $fechaaprobaciondisenos, hitodisenocumplido: $hitodisenocumplido, retiesino: $retiesino, vigenciaretie: $vigenciaretie, fechatcacontractual: $fechatcacontractual, fechaestimadatcacierremlm: $fechaestimadatcacierremlm, hitotcacumplido: $hitotcacumplido, plandeproduccion: $plandeproduccion, fechapruebasqmlm: $fechapruebasqmlm, hitopruebasqcumplido: $hitopruebasqcumplido, rollingtenderdeclarado: $rollingtenderdeclarado, rollingtenderno: $rollingtenderno, tiempoestimadodetransporte: $tiempoestimadodetransporte, fechaentregaincotermactualizada: $fechaentregaincotermactualizada, hitocumplido: $hitocumplido, factorivanac: $factorivanac, fechacambio: $fechacambio, personacambio: $personacambio, estado: $estado, tasa: $tasa, tasasap: $tasasap)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HistoricoReg &&
      other.id == id &&
      other.contrato == contrato &&
      other.documentocompras == documentocompras &&
      other.fechadocumento == fechadocumento &&
      other.proveedor == proveedor &&
      other.proyecto == proyecto &&
      other.bdg2024 == bdg2024 &&
      other.posicion == posicion &&
      other.material == material &&
      other.textobreve == textobreve &&
      other.unidadmedida == unidadmedida &&
      other.cantidaddepedido == cantidaddepedido &&
      other.conformado == conformado &&
      other.saldo == saldo &&
      other.moneda == moneda &&
      other.precioneto == precioneto &&
      other.valornetodepedido == valornetodepedido &&
      other.subtotalcop == subtotalcop &&
      other.ivagastosnacionalizacion == ivagastosnacionalizacion &&
      other.valortotalcop == valortotalcop &&
      other.vrpagado == vrpagado &&
      other.valoranticipo1 == valoranticipo1 &&
      other.nopdp == nopdp &&
      other.saldopendiente == saldopendiente &&
      other.fechadeentregaincoterm == fechadeentregaincoterm &&
      other.fechaconformidad == fechaconformidad &&
      other.mesequipo == mesequipo &&
      other.mesanticipos == mesanticipos &&
      other.gestor == gestor &&
      other.ou == ou &&
      other.familia == familia &&
      other.incoterm == incoterm &&
      other.puerto == puerto &&
      other.wbe == wbe &&
      other.observaciones1 == observaciones1 &&
      other.observaciones2 == observaciones2 &&
      other.fechafirmadelcontratodecontrato == fechafirmadelcontratodecontrato &&
      other.fechafinalizacioncontrato == fechafinalizacioncontrato &&
      other.fechaactadeinicio == fechaactadeinicio &&
      other.tiemposdetcadias == tiemposdetcadias &&
      other.tiemposdeentregadias == tiemposdeentregadias &&
      other.fechaentregaoda == fechaentregaoda &&
      other.fechaaprobaciondisenos == fechaaprobaciondisenos &&
      other.hitodisenocumplido == hitodisenocumplido &&
      other.retiesino == retiesino &&
      other.vigenciaretie == vigenciaretie &&
      other.fechatcacontractual == fechatcacontractual &&
      other.fechaestimadatcacierremlm == fechaestimadatcacierremlm &&
      other.hitotcacumplido == hitotcacumplido &&
      other.plandeproduccion == plandeproduccion &&
      other.fechapruebasqmlm == fechapruebasqmlm &&
      other.hitopruebasqcumplido == hitopruebasqcumplido &&
      other.rollingtenderdeclarado == rollingtenderdeclarado &&
      other.rollingtenderno == rollingtenderno &&
      other.tiempoestimadodetransporte == tiempoestimadodetransporte &&
      other.fechaentregaincotermactualizada == fechaentregaincotermactualizada &&
      other.hitocumplido == hitocumplido &&
      other.factorivanac == factorivanac &&
      other.fechacambio == fechacambio &&
      other.personacambio == personacambio &&
      other.estado == estado &&
      other.tasa == tasa &&
      other.tasasap == tasasap;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      contrato.hashCode ^
      documentocompras.hashCode ^
      fechadocumento.hashCode ^
      proveedor.hashCode ^
      proyecto.hashCode ^
      bdg2024.hashCode ^
      posicion.hashCode ^
      material.hashCode ^
      textobreve.hashCode ^
      unidadmedida.hashCode ^
      cantidaddepedido.hashCode ^
      conformado.hashCode ^
      saldo.hashCode ^
      moneda.hashCode ^
      precioneto.hashCode ^
      valornetodepedido.hashCode ^
      subtotalcop.hashCode ^
      ivagastosnacionalizacion.hashCode ^
      valortotalcop.hashCode ^
      vrpagado.hashCode ^
      valoranticipo1.hashCode ^
      nopdp.hashCode ^
      saldopendiente.hashCode ^
      fechadeentregaincoterm.hashCode ^
      fechaconformidad.hashCode ^
      mesequipo.hashCode ^
      mesanticipos.hashCode ^
      gestor.hashCode ^
      ou.hashCode ^
      familia.hashCode ^
      incoterm.hashCode ^
      puerto.hashCode ^
      wbe.hashCode ^
      observaciones1.hashCode ^
      observaciones2.hashCode ^
      fechafirmadelcontratodecontrato.hashCode ^
      fechafinalizacioncontrato.hashCode ^
      fechaactadeinicio.hashCode ^
      tiemposdetcadias.hashCode ^
      tiemposdeentregadias.hashCode ^
      fechaentregaoda.hashCode ^
      fechaaprobaciondisenos.hashCode ^
      hitodisenocumplido.hashCode ^
      retiesino.hashCode ^
      vigenciaretie.hashCode ^
      fechatcacontractual.hashCode ^
      fechaestimadatcacierremlm.hashCode ^
      hitotcacumplido.hashCode ^
      plandeproduccion.hashCode ^
      fechapruebasqmlm.hashCode ^
      hitopruebasqcumplido.hashCode ^
      rollingtenderdeclarado.hashCode ^
      rollingtenderno.hashCode ^
      tiempoestimadodetransporte.hashCode ^
      fechaentregaincotermactualizada.hashCode ^
      hitocumplido.hashCode ^
      factorivanac.hashCode ^
      fechacambio.hashCode ^
      personacambio.hashCode ^
      estado.hashCode ^
      tasa.hashCode ^
      tasasap.hashCode;
  }
}
