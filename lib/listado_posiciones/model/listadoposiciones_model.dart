import '../../resources/to_celda.dart';
import 'listadoposiciones_fila.dart';

class ListadoPosiciones {
  List<ListadoPosicionesFila> list = [];
  List<ToCelda> titles = [
    ToCelda(valor: 'Contrato', flex: 2),
    ToCelda(valor: 'Pos', flex: 1),
    ToCelda(valor: 'E4e', flex: 2),
    ToCelda(valor: 'Descripcion', flex: 4),
    ToCelda(valor: 'Um', flex: 1),
    ToCelda(valor: 'Ctd', flex: 2),
    ToCelda(valor: 'Precio Neto', flex: 2),
    ToCelda(valor: 'Valor Bruto', flex: 2),
    ToCelda(valor: 'Ctd En\nOrdenes', flex: 2),
    ToCelda(valor: 'Plazo Entrega', flex: 1),
    ToCelda(valor: 'Tipo\nMaterial', flex: 1),
    ToCelda(valor: 'Solicitante', flex: 1),
    ToCelda(valor: 'Centro', flex: 1),
  ];
}
