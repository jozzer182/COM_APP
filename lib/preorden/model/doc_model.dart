import 'package:com/preorden/model/reg_model.dart';

import '../../resources/to_celda.dart';

class PreordenDoc {
  List<PreordenReg> list = [];
  String razon = '';
  List<String> destinatarios = [];
  List<String> conCopia = [];
  String nota = '';

  List<ToCelda> get celdas => [
        ToCelda(valor: list.first.preorden, flex: 2),
        ToCelda(valor: list.first.estado, flex: 2),
        ToCelda(valor: list.first.fecha, flex: 2),
      ];

  PreordenDoc copyWith({
    List<PreordenReg>? list,
  }) {
    return PreordenDoc()
      ..list = list ?? this.list.map((e) => e.copyWith()).toList();
  }
}
