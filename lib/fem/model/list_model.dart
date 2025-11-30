import '../../resources/to_celda.dart';
import 'doc_model.dart';
import 'reg_model.dart';

class FemList {
  List<FemReg> list = [];
  List<FemDoc> listDoc = [];

  num ctdAno(String e4e) {
    int esteAno = DateTime.now().year;
    int proxAno = esteAno + 1;
    List<int> years = [esteAno, proxAno];
    int esteMes = DateTime.now().month + 1;
    num ctd = 0;
    for (int year in years) {
      FemDoc doc = listDoc.firstWhere((e) => e.year == year);
      int mesInicio = year == esteAno ? esteMes : 1;
      int mesFin = year == proxAno ? esteMes : 12;
      for (int month = mesInicio; month <= mesFin; month++) {
        for (FemReg reg in doc.list) {
          if (reg.e4e == e4e) {
            ctd += reg.mes(month);
          }
        }
      }
    }
    return ctd;
  }

  List<ToCelda> get titles => [
        ToCelda(valor: 'id', flex: 2),
        ToCelda(valor: 'Año', flex: 2),
        ToCelda(valor: 'Unidad', flex: 2),
        ToCelda(valor: 'Proyecto', flex: 6),
        ToCelda(valor: 'Pm', flex: 2),
        ToCelda(valor: 'Funcional', flex: 2),
        ToCelda(valor: 'E4e', flex: 2),
        ToCelda(valor: 'Descripción', flex: 6),
        ToCelda(valor: '01', flex: 1),
        ToCelda(valor: '02', flex: 1),
        ToCelda(valor: '03', flex: 1),
        ToCelda(valor: '04', flex: 1),
        ToCelda(valor: '05', flex: 1),
        ToCelda(valor: '06', flex: 1),
        ToCelda(valor: '07', flex: 1),
        ToCelda(valor: '08', flex: 1),
        ToCelda(valor: '09', flex: 1),
        ToCelda(valor: '10', flex: 1),
        ToCelda(valor: '11', flex: 1),
        ToCelda(valor: '12', flex: 1),
        ToCelda(valor: 'Total', flex: 1),
      ];
}
