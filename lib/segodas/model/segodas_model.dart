import 'dart:convert';

import 'package:com/segodas/model/segoda_model.dart';
import 'package:http/http.dart';

import '../../resources/constants/url.dart';
import '../../resources/to_celda.dart';

class SegOdas {
  List<SegOda> segOdasList = [];
  List<SegOda> segOdasListSearch = [];

  List<SegOda> segOdasListModified = [];

  List<ToCelda> titles = [
    ToCelda(valor: 'Proveedor', flex: 5),
    ToCelda(valor: 'OE', flex: 2),
    ToCelda(valor: 'Pos', flex: 1),
    ToCelda(valor: 'Proyecto', flex: 4),
    ToCelda(valor: 'E4E', flex: 2),
    ToCelda(valor: 'Descripción', flex: 5),
    ToCelda(valor: 'Ctd', flex: 1),
    ToCelda(valor: 'Gestor', flex: 2),
    ToCelda(valor: 'Mes', flex: 1),
    ToCelda(valor: 'Diseño', flex: 1),
    ToCelda(valor: 'TCA', flex: 1),
    ToCelda(valor: 'Pruebas', flex: 1),
    ToCelda(valor: 'Entregas', flex: 1),
  ];

  List<ToCelda> titlesDinero = [
    ToCelda(valor: 'Proveedor', flex: 5),
    ToCelda(valor: 'OE', flex: 2),
    ToCelda(valor: 'Pos', flex: 1),
    ToCelda(valor: 'Proyecto', flex: 4),
    ToCelda(valor: 'E4E', flex: 2),
    ToCelda(valor: 'Descripción', flex: 5),
    ToCelda(valor: 'Ctd', flex: 1),
    ToCelda(valor: 'Gestor', flex: 4),
    ToCelda(valor: 'Mes', flex: 1),
    ToCelda(valor: 'Total', flex: 2),
    ToCelda(valor: 'Mes\nAnticipo', flex: 1),
    ToCelda(valor: 'Anticipo', flex: 2),
    ToCelda(valor: 'Observaciones1', flex: 4),
    ToCelda(valor: 'Fecha\nCambio', flex: 1),
  ];

  obtener() async {
    Map<String, Object> dataSend = {
      'info': {'libro': 'BD', 'hoja': 'reg'},
      'fname': "getHoja"
    };
    // print("dataSend: $dataSend");
    final response = await post(
      Uri.parse(ApiUrl.com),
      body: jsonEncode(dataSend),
    );
    var dataAsListMap = jsonDecode(response.body);
    if (dataAsListMap.length > 0) {
      for (var item in dataAsListMap) {
        segOdasList.add(SegOda.fromMap(item));
      }
    }
    segOdasListSearch = [...segOdasList];
    // print('segOdasListSearch: $segOdasListSearch');
  }
}
