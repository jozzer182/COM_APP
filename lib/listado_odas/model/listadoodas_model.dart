import '../../resources/to_celda.dart';
import 'listadoodas_fila.dart';

class ListadoOdas {
  List<ListadoOdasFila> list = [];

  List<ToCelda> titles = [
    ToCelda(valor: 'Oda', flex: 2),
    ToCelda(valor: 'Pos', flex: 1),
    ToCelda(valor: 'E4e', flex: 2),
    ToCelda(valor: 'Descripción', flex: 4),
    ToCelda(valor: 'um', flex: 1),
    ToCelda(valor: 'Ctd', flex: 2),
    ToCelda(valor: 'Entregado', flex: 2),
    ToCelda(valor: 'Por\nEntregar', flex: 2),
    ToCelda(valor: 'Cantidad\nBase', flex: 2),
    ToCelda(valor: 'Precio Neto', flex: 2),
    ToCelda(valor: 'Valor Neto', flex: 2),
    ToCelda(valor: 'Moneda', flex: 1),
    ToCelda(valor: 'Fecha Pedido', flex: 2),
    ToCelda(valor: 'Fecha Entrega', flex: 2),
    ToCelda(valor: 'Inco', flex: 1),
    ToCelda(valor: 'Destino', flex: 2),
    ToCelda(valor: 'Proveedor', flex: 2),
    ToCelda(valor: 'Contrato', flex: 2),
  ];
}
