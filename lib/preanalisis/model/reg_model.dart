import 'package:com/resources/to_celda.dart';

class PreanalisisReg {
  String e4e;
  String descripcion;
  num plataforma;
  num oe;
  num fem;
  num otros;
  num cupo;
  String contratos;
  // num valorunitario;
  // String moneda;
  PreanalisisReg({
    required this.e4e,
    required this.descripcion,
    required this.plataforma,
    required this.oe,
    required this.fem,
    required this.otros,
    required this.cupo,
    required this.contratos,
    // required this.valorunitario,
    // required this.moneda,
  });
  num get oferta => plataforma + oe;
  num get demanda => fem + otros;
  num get disponibilidad => oferta - demanda;

  List<String> toList() {
    return [
      e4e,
      descripcion,
      plataforma.toString(),
      oe.toString(),
      oferta.toString(),
      fem.toString(),
      otros.toString(),
      demanda.toString(),
      disponibilidad.toString(),
      cupo.toString(),
      contratos,
    ];
  }

  List<ToCelda> get celdas => [
        ToCelda(valor: e4e, flex: 2),
        ToCelda(valor: descripcion, flex: 6),
        ToCelda(valor: plataforma.toString(), flex: 2),
        ToCelda(valor: oe.toString(), flex: 2),
        ToCelda(valor: oferta.toString(), flex: 2),
        ToCelda(valor: fem.toString(), flex: 2),
        ToCelda(valor: otros.toString(), flex: 2),
        ToCelda(valor: demanda.toString(), flex: 2),
        ToCelda(valor: disponibilidad.toString(), flex: 2),
        ToCelda(valor: cupo.toString(), flex: 2),
        ToCelda(valor: contratos, flex: 2),
      ];
}
