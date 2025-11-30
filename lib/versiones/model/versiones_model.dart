// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:statistics/statistics.dart';

import '../../resources/a_entero_2.dart';
import '../../resources/constants/apis.dart';
import 'versiones_model_sumsingle.dart';

class Versiones {
  List<VersionByE4e> version2023 = [];
  List<VersionByE4e> version2024 = [];
  List<VersionByE4e> version2025 = [];
  List<VersionByE4e> version2026 = [];
  List<VersionByE4e> version2027 = [];
  List<VersionByE4e> version2028 = [];
  List<VersionReg> v2023 = [];
  List<VersionReg> v2024 = [];
  List<VersionReg> v2025 = [];
  List<VersionReg> v2026 = [];
  List<VersionReg> v2027 = [];
  List<VersionReg> v2028 = [];

  List<VersionByE4e> obtenerAnoSum(int ano) {
    if (ano == 2023) return version2023;
    if (ano == 2024) return version2024;
    if (ano == 2025) return version2025;
    if (ano == 2026) return version2026;
    if (ano == 2027) return version2027;
    if (ano == 2028) return version2028;
    return [];
  }

  num ctdAno(String e4e) {
    int esteAno = DateTime.now().year;
    int proxAno = esteAno + 1;
    List<int> years = [esteAno, proxAno];
    int esteMes = DateTime.now().month + 1;
    num ctd = 0;
    for (int year in years) {
      List<VersionByE4e> doc = version2024;
      if (year == 2025) doc = version2025;
      if (year == 2026) doc = version2026;
      if (year == 2027) doc = version2027;
      if (year == 2028) doc = version2028;
      int mesInicio = year == esteAno ? esteMes : 1;
      int mesFin = year == proxAno ? esteMes : 12;
      for (int month = mesInicio; month <= mesFin; month++) {
        for (VersionByE4e reg in doc) {
          if (reg.e4e == e4e) {
            ctd += reg.campo(month);
          }
        }
      }
    }
    return ctd;
  }

  int view = 70;
  Map itemsAndFlex = {
    'proyecto': [6, 'Proyecto'],
    'unidad': [2, 'Unidad'],
    'e4e': [2, 'E4e'],
    'descripcion': [6, 'Descripción'],
    'm01': [1, '01'],
    'm02': [1, '02'],
    'm03': [1, '03'],
    'm04': [1, '04'],
    'm05': [1, '05'],
    'm06': [1, '06'],
    'm07': [1, '07'],
    'm08': [1, '08'],
    'm09': [1, '09'],
    'm10': [1, '10'],
    'm11': [1, '11'],
    'm12': [1, '12'],
    'total': [1, 'total'],
  };

  get keys {
    return itemsAndFlex.keys.toList();
  }

  get listaTitulo {
    return [
      for (var key in keys)
        {'texto': itemsAndFlex[key][1], 'flex': itemsAndFlex[key][0]},
    ];
  }

  Future<List<VersionReg>> obtener(String version) async {
    var dataSend = {
      'dataReq': {'libro': 'versiones', 'hoja': version},
      'fname': "getHojaList",
    };
    // print(jsonEncode(dataSend));
    final response = await http.post(
      Uri.parse(Api.fem),
      body: jsonEncode(dataSend),
    );
    // print(response.body);
    List dataAsListMap;
    if (response.statusCode == 302) {
      var response2 = await http.get(
        Uri.parse(response.headers["location"].toString().replaceAll(',', '')),
      );
      dataAsListMap = jsonDecode(response2.body);
    } else {
      dataAsListMap = jsonDecode(response.body);
    }
    // print('dataAsListMap $version : ${dataAsListMap.length}');
    Map sumByE4e = {};
    List<VersionByE4e> versionAno = version2023;
    List<VersionReg> vAno = v2023;
    if (version == '2023') {
      version2023 = [];
      version2023.clear();
      versionAno = version2023;
      v2023 = [];
      v2023.clear();
      vAno = v2023;
    }
    if (version == '2024') {
      version2024 = [];
      version2024.clear();
      versionAno = version2024;
      v2024 = [];
      v2024.clear();
      vAno = v2024;
    }
    if (version == '2025') {
      version2025 = [];
      version2025.clear();
      versionAno = version2025;
      v2025 = [];
      v2025.clear();
      vAno = v2025;
    }
    if (version == '2026') {
      version2026 = [];
      version2026.clear();
      versionAno = version2026;
      v2026 = [];
      v2026.clear();
      vAno = v2026;
    }
    if (version == '2027') {
      version2027 = [];
      version2027.clear();
      versionAno = version2027;
      v2027 = [];
      v2027.clear();
      vAno = v2027;
    }
    if (version == '2028') {
      version2028 = [];
      version2028.clear();
      versionAno = version2028;
      v2028 = [];
      v2028.clear();
      vAno = v2028;
    }

    if (dataAsListMap.length > 1) {
      for (var item in dataAsListMap.sublist(1)) {
        vAno.add(VersionReg.fromList(item));
        if (!item[2].toString().startsWith('PM')) {
          if (sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}'] ==
              null) {
            sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}'] =
                {
                  'unidad': item[2].toString(),
                  'e4e': item[4].toString(),
                  'm01': 0,
                  'm02': 0,
                  'm03': 0,
                  'm04': 0,
                  'm05': 0,
                  'm06': 0,
                  'm07': 0,
                  'm08': 0,
                  'm09': 0,
                  'm10': 0,
                  'm11': 0,
                  'm12': 0,
                };
          }
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m01'] +=
              double.parse(item[6].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m02'] +=
              double.parse(item[7].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m03'] +=
              double.parse(item[8].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m04'] +=
              double.parse(item[9].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m05'] +=
              double.parse(item[10].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m06'] +=
              double.parse(item[11].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m07'] +=
              double.parse(item[12].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m08'] +=
              double.parse(item[13].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m09'] +=
              double.parse(item[14].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m10'] +=
              double.parse(item[15].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m11'] +=
              double.parse(item[16].toString());
          sumByE4e['${item[4].toString()}-${item[2].toString().toLowerCase()}']['m12'] +=
              double.parse(item[17].toString());
        }
      }
    }
    for (var key in sumByE4e.keys) {
      Map item = sumByE4e[key];
      versionAno.add(
        VersionByE4e(
          unidad: item['unidad'],
          e4e: item['e4e'].toString(),
          m01: aNum(item['m01'].toString()).toInt(),
          m02: aNum(item['m02'].toString()).toInt(),
          m03: aNum(item['m03'].toString()).toInt(),
          m04: aNum(item['m04'].toString()).toInt(),
          m05: aNum(item['m05'].toString()).toInt(),
          m06: aNum(item['m06'].toString()).toInt(),
          m07: aNum(item['m07'].toString()).toInt(),
          m08: aNum(item['m08'].toString()).toInt(),
          m09: aNum(item['m09'].toString()).toInt(),
          m10: aNum(item['m10'].toString()).toInt(),
          m11: aNum(item['m11'].toString()).toInt(),
          m12: aNum(item['m12'].toString()).toInt(),
          total:
              aNum(item['m01'].toString()).toInt() +
              aNum(item['m02'].toString()).toInt() +
              aNum(item['m03'].toString()).toInt() +
              aNum(item['m04'].toString()).toInt() +
              aNum(item['m05'].toString()).toInt() +
              aNum(item['m06'].toString()).toInt() +
              aNum(item['m07'].toString()).toInt() +
              aNum(item['m08'].toString()).toInt() +
              aNum(item['m09'].toString()).toInt() +
              aNum(item['m10'].toString()).toInt() +
              aNum(item['m11'].toString()).toInt() +
              aNum(item['m12'].toString()).toInt(),
        ),
      );
    }

    return vAno;
  }

  // buscar(String query) {
  //   version12023ListSearch = version12023List
  //       .where((element) => element.toList().any((item) =>
  //           item.toString().toLowerCase().contains(query.toLowerCase())))
  //       .toList();
  //   version22023ListSearch = version22023List
  //       .where((element) => element.toList().any((item) =>
  //           item.toString().toLowerCase().contains(query.toLowerCase())))
  //       .toList();
  //   version32023ListSearch = version32023List
  //       .where((element) => element.toList().any((item) =>
  //           item.toString().toLowerCase().contains(query.toLowerCase())))
  //       .toList();
  //   version42023ListSearch = version42023List
  //       .where((element) => element.toList().any((item) =>
  //           item.toString().toLowerCase().contains(query.toLowerCase())))
  //       .toList();
  // }

  List<Map<String, dynamic>> groupByList(
    List<Map<String, dynamic>> data,
    List<String> keysToSelect,
    List<String> keysToSum,
  ) {
    // print('groupByList from forecast model');
    // print(keysToSelect);
    List<Map<String, dynamic>> dataKeyAsJson =
        data.map((e) {
          e['asJson'] = {};
          for (var key in keysToSelect) {
            e['asJson'].addAll({key: e[key]});
            e.remove(key);
          }
          e['asJson'] = jsonEncode(e['asJson']);
          return e;
        }).toList();
    // print('dataKeyAsJson = $dataKeyAsJson');

    Map<dynamic, Map<String, num>> groupAsMap = groupBy(
      dataKeyAsJson,
      (Map e) => e['asJson'],
    ).map(
      (key, value) => MapEntry(key, {
        for (var keySum in keysToSum)
          keySum: value.fold<num>(0, (p, a) => p + (a[keySum] as num)),
      }),
    );
    // print('groupAsMap = $groupAsMap');

    List<Map<String, dynamic>> result =
        groupAsMap.entries.map((e) {
          Map<String, dynamic> newMap = jsonDecode(e.key);
          return {...newMap, ...e.value};
        }).toList();
    // print('result = $result');

    return result;
  }
}

class VersionE4eSingle {
  String e4e;
  String m01;
  String m02;
  String m03;
  VersionE4eSingle({
    required this.e4e,
    required this.m01,
    required this.m02,
    required this.m03,
  });

  VersionE4eSingle copyWith({
    String? e4e,
    String? m01,
    String? m02,
    String? m03,
  }) {
    return VersionE4eSingle(
      e4e: e4e ?? this.e4e,
      m01: m01 ?? this.m01,
      m02: m02 ?? this.m02,
      m03: m03 ?? this.m03,
    );
  }

  Map<String, dynamic> toMap() {
    return {'e4e': e4e, 'm01': m01, 'm02': m02, 'm03': m03};
  }

  factory VersionE4eSingle.fromMap(Map<String, dynamic> map) {
    return VersionE4eSingle(
      e4e: map['e4e'] ?? '',
      m01: map['m01'] ?? '',
      m02: map['m02'] ?? '',
      m03: map['m03'] ?? '',
    );
  }

  factory VersionE4eSingle.fromZero() {
    return VersionE4eSingle(e4e: '', m01: '0', m02: '0', m03: '0');
  }

  String toJson() => json.encode(toMap());

  factory VersionE4eSingle.fromJson(String source) =>
      VersionE4eSingle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VersionE4eSingle(e4e: $e4e, m01: $m01, m02: $m02, m03: $m03)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VersionE4eSingle &&
        other.e4e == e4e &&
        other.m01 == m01 &&
        other.m02 == m02 &&
        other.m03 == m03;
  }

  @override
  int get hashCode {
    return e4e.hashCode ^ m01.hashCode ^ m02.hashCode ^ m03.hashCode;
  }
}

class VersionReg {
  String codigo;
  String proyecto;
  String unidad;
  String pm;
  String e4e;
  String descripcion;
  String m01;
  String m02;
  String m03;
  String m04;
  String m05;
  String m06;
  String m07;
  String m08;
  String m09;
  String m10;
  String m11;
  String m12;
  VersionReg({
    required this.codigo,
    required this.proyecto,
    required this.unidad,
    required this.pm,
    required this.e4e,
    required this.descripcion,
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

  List<String> toList() {
    return [
      codigo,
      proyecto,
      unidad,
      pm,
      e4e,
      descripcion,
      m01,
      m02,
      m03,
      m04,
      m05,
      m06,
      m07,
      m08,
      m09,
      m10,
      m11,
      m12,
    ];
  }

  int get total =>
      aEntero(m01) +
      aEntero(m02) +
      aEntero(m03) +
      aEntero(m04) +
      aEntero(m05) +
      aEntero(m06) +
      aEntero(m07) +
      aEntero(m08) +
      aEntero(m09) +
      aEntero(m10) +
      aEntero(m11) +
      aEntero(m12);

  int campo(int n) {
    if (n == 1) return aEntero(m01);
    if (n == 2) return aEntero(m02);
    if (n == 3) return aEntero(m03);
    if (n == 4) return aEntero(m04);
    if (n == 5) return aEntero(m05);
    if (n == 6) return aEntero(m06);
    if (n == 7) return aEntero(m07);
    if (n == 8) return aEntero(m08);
    if (n == 9) return aEntero(m09);
    if (n == 10) return aEntero(m10);
    if (n == 11) return aEntero(m11);
    if (n == 12) return aEntero(m12);
    return aEntero(m12);
  }

  bool isNotEmptyBetween(int mesInicio, int mesFin) {
    for (var i = mesInicio; i <= mesFin; i++) {
      if (campo(i) > 0) return true;
    }
    return false;
  }

  int between(int mesInicio, int mesFin) {
    int total = 0;
    for (var i = mesInicio; i <= mesFin; i++) {
      total += campo(i);
    }
    return total;
  }

  Map<String, dynamic> get mapWTotal {
    return {
      'proyecto': [6, proyecto],
      'unidad': [2, unidad],
      'e4e': [2, e4e],
      'descripcion': [6, descripcion],
      'm01': [1, m01],
      'm02': [1, m02],
      'm03': [1, m03],
      'm04': [1, m04],
      'm05': [1, m05],
      'm06': [1, m06],
      'm07': [1, m07],
      'm08': [1, m08],
      'm09': [1, m09],
      'm10': [1, m10],
      'm11': [1, m11],
      'm12': [1, m12],
      'total': [1, total.toString()],
    };
  }

  VersionReg copyWith({
    String? codigo,
    String? proyecto,
    String? unidad,
    String? pm,
    String? e4e,
    String? descripcion,
    String? m01,
    String? m02,
    String? m03,
    String? m04,
    String? m05,
    String? m06,
    String? m07,
    String? m08,
    String? m09,
    String? m10,
    String? m11,
    String? m12,
  }) {
    return VersionReg(
      codigo: codigo ?? this.codigo,
      proyecto: proyecto ?? this.proyecto,
      unidad: unidad ?? this.unidad,
      pm: pm ?? this.pm,
      e4e: e4e ?? this.e4e,
      descripcion: descripcion ?? this.descripcion,
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
      'codigo': codigo,
      'proyecto': proyecto,
      'unidad': unidad,
      'pm': pm,
      'e4e': e4e,
      'descripcion': descripcion,
      'm01': m01,
      'm02': m02,
      'm03': m03,
      'm04': m04,
      'm05': m05,
      'm06': m06,
      'm07': m07,
      'm08': m08,
      'm09': m09,
      'm10': m10,
      'm11': m11,
      'm12': m12,
    };
  }

  factory VersionReg.fromMap(Map<String, dynamic> map) {
    return VersionReg(
      codigo: map['codigo'].toString(),
      proyecto: map['proyecto'].toString(),
      unidad: map['unidad'].toString(),
      pm: map['pm'].toString(),
      e4e: map['e4e'].toString(),
      descripcion: map['descripcion'].toString(),
      m01: map['m01'].toString(),
      m02: map['m02'].toString(),
      m03: map['m03'].toString(),
      m04: map['m04'].toString(),
      m05: map['m05'].toString(),
      m06: map['m06'].toString(),
      m07: map['m07'].toString(),
      m08: map['m08'].toString(),
      m09: map['m09'].toString(),
      m10: map['m10'].toString(),
      m11: map['m11'].toString(),
      m12: map['m12'].toString(),
    );
  }

  factory VersionReg.fromZero() {
    return VersionReg(
      codigo: '',
      proyecto: '',
      unidad: '',
      pm: '',
      e4e: '',
      descripcion: '',
      m01: '0',
      m02: '0',
      m03: '0',
      m04: '0',
      m05: '0',
      m06: '0',
      m07: '0',
      m08: '0',
      m09: '0',
      m10: '0',
      m11: '0',
      m12: '0',
    );
  }

  factory VersionReg.fromList(List l) {
    return VersionReg(
      codigo: l[0].toString(),
      proyecto: l[1].toString(),
      unidad: l[2].toString(),
      pm: l[3].toString(),
      e4e: l[4].toString(),
      descripcion: l[5].toString(),
      m01: l[6].toString(),
      m02: l[7].toString(),
      m03: l[8].toString(),
      m04: l[9].toString(),
      m05: l[10].toString(),
      m06: l[11].toString(),
      m07: l[12].toString(),
      m08: l[13].toString(),
      m09: l[14].toString(),
      m10: l[15].toString(),
      m11: l[16].toString(),
      m12: l[17].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionReg.fromJson(String source) =>
      VersionReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VersionesSingle(codigo: $codigo, proyecto: $proyecto, unidad: $unidad, pm: $pm, e4e: $e4e, descripcion: $descripcion, m01: $m01, m02: $m02, m03: $m03, m04: $m04, m05: $m05, m06: $m06, m07: $m07, m08: $m08, m09: $m09, m10: $m10, m11: $m11, m12: $m12)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VersionReg &&
        other.codigo == codigo &&
        other.proyecto == proyecto &&
        other.unidad == unidad &&
        other.pm == pm &&
        other.e4e == e4e &&
        other.descripcion == descripcion &&
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

  @override
  int get hashCode {
    return codigo.hashCode ^
        proyecto.hashCode ^
        unidad.hashCode ^
        pm.hashCode ^
        e4e.hashCode ^
        descripcion.hashCode ^
        m01.hashCode ^
        m02.hashCode ^
        m03.hashCode ^
        m04.hashCode ^
        m05.hashCode ^
        m06.hashCode ^
        m07.hashCode ^
        m08.hashCode ^
        m09.hashCode ^
        m10.hashCode ^
        m11.hashCode ^
        m12.hashCode;
  }
}
