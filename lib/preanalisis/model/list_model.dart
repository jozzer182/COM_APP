import 'package:com/preanalisis/model/list_cupocontrato_mode.dart';
import 'package:com/preanalisis/model/list_proyecto.dart';

import '../../resources/to_celda.dart';
import 'reg_model.dart';

class PreanalisisList {
  List<PreanalisisReg> list = [];
  List<ToCelda> get titles => [
        ToCelda(valor: 'E4e', flex: 2),
        ToCelda(valor: 'Descripción', flex: 6),
        ToCelda(valor: 'Plataforma', flex: 2),
        ToCelda(valor: 'Oe', flex: 2),
        ToCelda(valor: 'Oferta', flex: 2),
        ToCelda(valor: 'Fem', flex: 2),
        ToCelda(valor: 'Otros', flex: 2),
        ToCelda(valor: 'Demanda', flex: 2),
        ToCelda(valor: 'Disponibilidad', flex: 2),
        ToCelda(valor: 'Cupo', flex: 2),
        ToCelda(valor: 'Contratos', flex: 2),
      ];

  CupocontratoList cupocontratoList = CupocontratoList();
  PreanalisisProyectoList proyectoList = PreanalisisProyectoList();
}
