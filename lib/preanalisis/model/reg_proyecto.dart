class PreanalisisProyectoReg {
  String proyecto;
  String pm;
  String portfolio;
  String e4e;
  String descripcion;
  String um;
  String ctd;
  String femid;
  String femctd;
  String femfecha;
  String femobservacion;
  String wbe;
  String proyectowbe;
  PreanalisisProyectoReg({
    required this.proyecto,
    required this.pm,
    required this.portfolio,
    required this.e4e,
    required this.descripcion,
    required this.um,
    required this.ctd,
    required this.femid,
    required this.femctd,
    required this.femfecha,
    required this.femobservacion,
    required this.wbe,
    required this.proyectowbe,
  });

  @override
  String toString() {
    return 'PreanalisisProyectoReg(proyecto: $proyecto, pm: $pm, portfolio: $portfolio, e4e: $e4e, descripcion: $descripcion, um: $um, ctd: $ctd, femid: $femid, femctd: $femctd, femfecha: $femfecha, femobservacion: $femobservacion, wbe: $wbe, proyectowbe: $proyectowbe)';
  }
}
