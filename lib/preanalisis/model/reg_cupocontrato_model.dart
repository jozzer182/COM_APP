class CupoContrato {
  String contrato;
  String objeto;
  String e4e;
  num cupo;
  DateTime fin;
  num valorrestante;
  num porcentajerestante;
  num valorunitario;
  String moneda;
  bool seleccionado;
  CupoContrato({
    required this.contrato,
    required this.objeto,
    required this.e4e,
    required this.cupo,
    required this.fin,
    required this.valorrestante,
    required this.porcentajerestante,
    required this.valorunitario,
    required this.moneda,
    this.seleccionado = false,
  });
}
