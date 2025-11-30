import 'package:bloc/bloc.dart';

import '../../bloc/main_bloc.dart';
import '../model/contratos_model.dart';
import '../model/contrato_model.dart';

onLoadContrato(
  event,
  Emitter<MainState> emit,
  MainState Function() state,
) async {
  Contrato contrato = Contrato();
  try {
    await contrato.obtener();
    emit(state().copyWith(contrato: contrato));
  } catch (e) {
    emit(state().copyWith(
      errorCounter: state().errorCounter + 1,
      message:
          '🤕Error llamando📞 la tabla de datos Contrato ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
    ));
  }
}

onSeleccionarContratoPlanilla(
  SeleccionarContratoPlanilla event,
  Emitter emit,
  MainState Function() supraState,
) {
  emit(
    supraState().copyWith(
      contratoPlanilla: event.planilla,
    ),
  );
}

onCambiarContratoPlanilla(
  CambiarContratoPlanilla event,
  Emitter emit,
  MainState Function() supraState,
) async {
  ContratoPlanilla contratoPlanilla = supraState().contratoPlanilla!;
  contratoPlanilla.asignar(
    valor: event.valor,
    item: event.item,
    campo: event.campo,
  );
  //esperar 100 milisegundos
  await Future.delayed(const Duration(milliseconds: 100), () {
    emit(supraState().copyWith(
      contratoPlanilla: contratoPlanilla,
    ));
  });
}

onResizeContratoPlanilla(
  ResizeContratoPlanilla event,
  Emitter emit,
  MainState Function() supraState,
) async {
  ContratoPlanilla contratoPlanilla = supraState().contratoPlanilla!;
  contratoPlanilla.modifyList(
    event.ctd,
    event.metodo,
  );
  //esperar 100 milisegundos
  await Future.delayed(const Duration(milliseconds: 100), () {
    emit(supraState().copyWith(
      contratoPlanilla: contratoPlanilla,
    ));
  });
}

onGuardarContratoPlanilla(
  GuardarContratoPlanilla event,
  Emitter emit,
  MainState Function() state,
  Function add,
) async {
  emit(state().copyWith(
    isLoading: true,
  ));
  ContratoPlanilla contratoPlanilla = state().contratoPlanilla!;
  String? respuesta;
  try {
    respuesta = await contratoPlanilla.enviar(
      user: event.user,
      esNuevo: event.esNuevo,
    );
    emit(state().copyWith(
      contratoPlanilla: contratoPlanilla,
    ));
    add(Load());
  } catch (e) {
    emit(state().copyWith(
      errorCounter: state().errorCounter + 1,
      message:
          '🤕Error guardando la tabla de datos Contrato ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
    ));
  }
  emit(state().copyWith(
    dialogCounter: state().dialogCounter + 1,
    dialogMessage: respuesta ?? 'Error en el envío',
  ));
  emit(state().copyWith(
    isLoading: false,
  ));
}

onAnularContratoPlanilla(
  AnularContratoPlanilla event,
  Emitter emit,
  MainState Function() state,
  Function add,
) async {
  emit(state().copyWith(
    isLoading: true,
  ));
  ContratoPlanilla contratoPlanilla = state().contratoPlanilla!;
  String? respuesta;
  try {
    respuesta = await contratoPlanilla.anular(
      user: event.user,
    );
    emit(state().copyWith(
      contratoPlanilla: contratoPlanilla,
    ));
    add(Load());
  } catch (e) {
    emit(state().copyWith(
      errorCounter: state().errorCounter + 1,
      message:
          '🤕Error anulando un dato de la tabla de datos Contrato ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
    ));
  }
  emit(state().copyWith(
    dialogCounter: state().dialogCounter + 1,
    dialogMessage: respuesta ?? 'Error en el envío',
  ));
  emit(state().copyWith(
    isLoading: false,
  ));
}
