import 'package:com/listado_contratos/model/listadocontrato_fila.dart';

import '../../resources/to_celda.dart';

class ListadoContratos {
  List<ListadoContratosFila> list = [];

  List<ToCelda> titles = [
    ToCelda (valor:'Contrato', flex: 2),
    ToCelda (valor:'Objeto', flex: 2),
    ToCelda (valor:'Inicio', flex: 2),
    ToCelda (valor:'Fin', flex: 2),
    ToCelda (valor:'Días restantes', flex: 2),
    ToCelda (valor:'Valor Previsto', flex: 2),
    ToCelda (valor:'Valor Neto', flex: 2),
    ToCelda (valor:'Valor Restante', flex: 2),
    ToCelda (valor:'Moneda', flex: 2),
  ];
}
