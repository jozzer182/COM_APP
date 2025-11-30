import 'package:com/preorden/model/doc_model.dart';
import 'package:com/preorden/model/reg_model.dart';
import 'package:com/resources/to_celda.dart';

class PreordenList {
  List<PreordenDoc> list = [];
  List<PreordenReg> registros = [];
  List<ToCelda> get titles => [
        ToCelda(valor: 'Preorden', flex: 2),
        ToCelda(valor: 'Estado', flex: 2),
        ToCelda(valor: 'Fecha', flex: 2),
      ];
}
