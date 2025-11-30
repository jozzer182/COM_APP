part of '../../bloc/main_bloc.dart';

class SeleccionarContratoPlanilla extends MainEvent {
  final ContratoPlanilla planilla;
  SeleccionarContratoPlanilla({
    required this.planilla,
  });
}

class CambiarContratoPlanilla extends MainEvent {
  final String valor;
  final int item;
  final CampoContratoPlanilla campo;
  CambiarContratoPlanilla({
    required this.valor,
    required this.item,
    required this.campo,
  });
}

class ResizeContratoPlanilla extends MainEvent {
  final String metodo;
  final int ctd;
  ResizeContratoPlanilla({
    required this.metodo,
    required this.ctd,
  });
}

class GuardarContratoPlanilla extends MainEvent {
  final User user;
  final bool esNuevo;
  GuardarContratoPlanilla({
    required this.user,
    required this.esNuevo,
  });
}

class AnularContratoPlanilla extends MainEvent {
  final User user;
  AnularContratoPlanilla({
    required this.user,
  });
}