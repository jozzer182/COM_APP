import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../resources/constants/apis.dart';
import '../../resources/to_celda.dart';

class Oe {
  List<OeSingle> oeList = [];
  List<OeSingle> oeListSearch = [];
  Map oeByE4e = {};
  List<String> e4eList = [];
  int view = 70;
  bool loading = false;
  List<ToCelda> titles = [
    ToCelda(valor: 'Po', flex: 2),
    ToCelda(valor: 'Pos', flex: 1),
    ToCelda(valor: 'Proovedor', flex: 6),
    ToCelda(valor: 'E4e', flex: 2),
    ToCelda(valor: 'Descripción', flex: 6),
    ToCelda(valor: 'Ctd', flex: 2),
    ToCelda(valor: 'Precio', flex: 2),
    ToCelda(valor: 'Fecha', flex: 2),
    ToCelda(valor: 'Inco', flex: 1),
    ToCelda(valor: 'Destino', flex: 4),
    ToCelda(valor: 'Grupo', flex: 2),
    ToCelda(valor: 'Usuario', flex: 6),
  ];

  // Map itemsAndFlex = {
  //   'po': [2, 'Po'],
  //   'pos': [1, 'Pos'],
  //   'proovedor': [6, 'Proovedor'],
  //   'e4e': [2, 'E4e'],
  //   'descripcion': [6, 'Descripción'],
  //   'ctd': [2, 'Ctd'],
  //   'fecha': [2, 'Fecha'],
  //   'incoterm': [1, 'Inco'],
  //   'destino': [4, 'Destino'],
  //   'grupo': [2, 'Grupo'],
  //   'usuario': [6, 'Usuario'],
  // };
  // get keys {
  //   return itemsAndFlex.keys.toList();
  // }

  // get listaTitulo {
  //   return [
  //     for (var key in keys)
  //       {'texto': itemsAndFlex[key][1], 'flex': itemsAndFlex[key][0]},
  //   ];
  // }

  buscar(String busqueda) {
    oeListSearch =
        oeList
            .where(
              (element) => element.toList().any(
                (item) => item.toString().toLowerCase().contains(
                  busqueda.toLowerCase(),
                ),
              ),
            )
            .toList();
  }

  num ctdAno(String e4e) {
    int esteAno = DateTime.now().year;
    int proxAno = esteAno + 1;
    List<int> years = [esteAno, proxAno];
    int esteMes = DateTime.now().month;
    num ctd = 0;
    for (int year in years) {
      int mesInicio = year == esteAno ? esteMes : 1;
      int mesFin = year == proxAno ? esteMes : 12;
      for (int month = mesInicio; month <= mesFin; month++) {
        if (oeByE4e['$e4e$month$year'] != null) {
          ctd += oeByE4e['$e4e$month$year']['ctd'];
        }
      }
    }
    return ctd;
  }

  Future<List<OeSingle>> obtener() async {
    var dataSend = {
      'dataReq': {'hoja': 'OE'},
      'fname': "getSAPList",
    };
    final response = await http.post(
      Uri.parse(Api.fem),
      body: jsonEncode(dataSend),
    );
    var dataAsListMap;

    dataAsListMap = jsonDecode(response.body);

    // print(dataAsListMap[0]);
    for (var item in dataAsListMap.sublist(1)) {
      oeList.add(OeSingle.fromList(item));
    }
    // oeList.sort((a, b) => a.po.compareTo(b.po));
    oeListSearch = [...oeList];
    List<OeSingle> oeListSinceToday =
        oeList
            .where(
              (e) =>
                  DateTime.parse(e.fecha).difference(DateTime.now()).inDays >=
                  0,
            )
            .toList();
    for (OeSingle reg in oeListSinceToday) {
      if (oeByE4e['${reg.e4e}${DateTime.parse(reg.fecha).month}${DateTime.parse(reg.fecha).year}'] ==
          null) {
        oeByE4e['${reg.e4e}${DateTime.parse(reg.fecha).month}${DateTime.parse(reg.fecha).year}'] =
            {'e4e': reg.e4e, 'ctd': 0.0};
      }
      oeByE4e['${reg.e4e}${DateTime.parse(reg.fecha).month}${DateTime.parse(reg.fecha).year}']['ctd'] +=
          double.parse(reg.ctd);
    }
    for (var key in oeByE4e.keys) {
      e4eList.add(oeByE4e[key]['e4e']);
    }
    e4eList.toSet().toList().sort();
    return oeList;
  }
}

class OeSingle {
  String po;
  String pos;
  String proovedor;
  String e4e;
  String descripcion;
  String ctd;
  String fecha;
  String incoterm;
  String destino;
  String grupo;
  String usuario;
  String actualizado;
  String fechaincoterm;
  String contrato;
  String fechadocumento;
  String tasa;
  String precioneto;
  String moneda;
  OeSingle({
    required this.po,
    required this.pos,
    required this.proovedor,
    required this.e4e,
    required this.descripcion,
    required this.ctd,
    required this.fecha,
    required this.incoterm,
    required this.destino,
    required this.grupo,
    required this.usuario,
    required this.actualizado,
    required this.fechaincoterm,
    required this.contrato,
    required this.fechadocumento,
    required this.tasa,
    required this.precioneto,
    required this.moneda,
  });

  List<ToCelda> get celdas => [
    ToCelda(valor: po, flex: 2),
    ToCelda(valor: pos, flex: 1),
    ToCelda(valor: proovedor, flex: 6),
    ToCelda(valor: e4e, flex: 2),
    ToCelda(valor: descripcion, flex: 6),
    ToCelda(valor: ctd, flex: 2),
    ToCelda(valor: precioneto, flex: 2),
    ToCelda(valor: fecha, flex: 2),
    ToCelda(valor: incoterm, flex: 1),
    ToCelda(valor: destino, flex: 4),
    ToCelda(valor: grupo, flex: 2),
    ToCelda(valor: usuario, flex: 6),
  ];

  List<String> toList() {
    return [
      po,
      pos,
      proovedor,
      e4e,
      descripcion,
      ctd,
      fecha,
      incoterm,
      destino,
      grupo,
      usuario,
      fechaincoterm,
      contrato,
      fechadocumento,
      tasa,
      precioneto,
      moneda,
      actualizado,
    ];
  }

  OeSingle copyWith({
    String? po,
    String? pos,
    String? proovedor,
    String? e4e,
    String? descripcion,
    String? ctd,
    String? fecha,
    String? incoterm,
    String? destino,
    String? grupo,
    String? usuario,
    String? actualizado,
    String? fechaincoterm,
    String? contrato,
    String? fechadocumento,
    String? tasa,
    String? precioneto,
    String? moneda,
  }) {
    return OeSingle(
      po: po ?? this.po,
      pos: pos ?? this.pos,
      proovedor: proovedor ?? this.proovedor,
      e4e: e4e ?? this.e4e,
      descripcion: descripcion ?? this.descripcion,
      ctd: ctd ?? this.ctd,
      fecha: fecha ?? this.fecha,
      incoterm: incoterm ?? this.incoterm,
      destino: destino ?? this.destino,
      grupo: grupo ?? this.grupo,
      usuario: usuario ?? this.usuario,
      actualizado: actualizado ?? this.actualizado,
      fechaincoterm: fechaincoterm ?? this.fechaincoterm,
      contrato: contrato ?? this.contrato,
      fechadocumento: fechadocumento ?? this.fechadocumento,
      tasa: tasa ?? this.tasa,
      precioneto: precioneto ?? this.precioneto,
      moneda: moneda ?? this.moneda,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'po': po,
      'pos': pos,
      'proovedor': proovedor,
      'e4e': e4e,
      'descripcion': descripcion,
      'ctd': ctd,
      'fecha': fecha,
      'incoterm': incoterm,
      'destino': destino,
      'grupo': grupo,
      'usuario': usuario,
      'fechaincoterm': fechaincoterm,
      'contrato': contrato,
      'fechadocumento': fechadocumento,
      'tasa': tasa,
      'precioneto': precioneto,
      'moneda': moneda,
      'actualizado': actualizado,
    };
  }

  factory OeSingle.fromMap(Map<String, dynamic> map) {
    // if(map['po'].toString() == "6000040227"){
    //   print("Error al convertir OeSingle desde Map: $map");
    // }
    return OeSingle(
      po: map['po'].toString(),
      pos: map['pos'].toString(),
      proovedor: map['proveedor']
          .toString()
          .replaceAll('"', '')
          .replaceAll(';', '')
          .replaceAll(',', '')
          .replaceAll("\n", " "),
      e4e: map['e4e'].toString(),
      descripcion: map['descripcion']
          .toString()
          .replaceAll('"', '')
          .replaceAll(';', '')
          .replaceAll(',', '')
          .replaceAll("\n", " "),
      ctd: map['ctd'].toString(),
      fecha: map['fecha'].toString().substring(0, 10),
      incoterm: map['incoterm'].toString(),
      destino: map['destino'].toString(),
      grupo: map['grupo'].toString(),
      usuario: map['usuario'].toString(),
      fechaincoterm: map['fechaincoterm'].toString(),
      contrato: map['contrato'].toString(),
      fechadocumento: map['fechadocumento'].toString(),
      tasa: map['tasa'].toString(),
      precioneto: map['precioneto'].toString(),
      moneda: map['moneda'].toString(),
      actualizado: map['actualizado'].toString(),
    );
  }

  factory OeSingle.fromList(List<dynamic> list) {
    return OeSingle(
      po: list[0].toString(),
      pos: list[1].toString(),
      proovedor: list[2]
          .toString()
          .replaceAll('"', '')
          .replaceAll(';', '')
          .replaceAll(',', '')
          .replaceAll("\n", " "),
      e4e: list[3].toString(),
      descripcion: list[4]
          .toString()
          .replaceAll('"', '')
          .replaceAll(';', '')
          .replaceAll(',', '')
          .replaceAll("\n", " "),
      ctd: list[5].toString(),
      fecha: list[6].toString().substring(0, 10),
      incoterm: list[7].toString(),
      destino: list[8].toString(),
      grupo: list[9].toString(),
      usuario: list[10].toString(),
      fechaincoterm: list[11].toString().substring(0, 10),
      contrato: list[12].toString(),
      fechadocumento: list[13].toString().substring(0, 10),
      tasa: list[14].toString(),
      precioneto: list[15].toString(),
      moneda: list[16].toString(),
      actualizado: list[17].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OeSingle.fromJson(String source) =>
      OeSingle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OeSingle(po: $po, pos: $pos, proovedor: $proovedor, e4e: $e4e, descripcion: $descripcion, ctd: $ctd, fecha: $fecha, incoterm: $incoterm, destino: $destino, grupo: $grupo, usuario: $usuario, actualizado: $actualizado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OeSingle &&
        other.po == po &&
        other.pos == pos &&
        other.proovedor == proovedor &&
        other.e4e == e4e &&
        other.descripcion == descripcion &&
        other.ctd == ctd &&
        other.fecha == fecha &&
        other.incoterm == incoterm &&
        other.destino == destino &&
        other.grupo == grupo &&
        other.usuario == usuario &&
        other.actualizado == actualizado;
  }

  @override
  int get hashCode {
    return po.hashCode ^
        pos.hashCode ^
        proovedor.hashCode ^
        e4e.hashCode ^
        descripcion.hashCode ^
        ctd.hashCode ^
        fecha.hashCode ^
        incoterm.hashCode ^
        destino.hashCode ^
        grupo.hashCode ^
        usuario.hashCode ^
        actualizado.hashCode;
  }
}
