// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:com/bloc/action_busqueda.dart';
import 'package:com/bloc/action_load_more.dart';
import 'package:com/bloc/main__bl.dart';
import 'package:com/budget/model/budget_model.dart';
import 'package:com/contrato/model/contrato_model.dart';
import 'package:com/eurcop/model/eurcop_model.dart';
import 'package:com/fem/model/list_model.dart';
import 'package:com/listado_contratos/model/listadocontrato.dart';
import 'package:com/listado_odas/model/listadoodas_model.dart';
import 'package:com/listado_posiciones/model/listadoposiciones_model.dart';
import 'package:com/oe/model/oe_model.dart';
import 'package:com/plataforma/model/plataforma_model.dart';
import 'package:com/preanalisis/model/list_model.dart';
import 'package:com/preorden/model/doc_model.dart';
import 'package:com/preorden/model/list_model.dart';
import 'package:com/resumenanticipos/model/resumenanticipos_model.dart';
import 'package:com/resumengestor/model/resumengestor_model.dart';
import 'package:com/resumenproveedor/model/resumenproveedor_model.dart';
import 'package:com/resumenproyecto/controller/resumenproyecto_controller.dart';
import 'package:com/resumenproyecto/model/resumenproyecto_model.dart';
import 'package:com/segodas/model/segoda_model.dart';
import 'package:com/segodas/model/segodas_model.dart';
import 'package:com/usdcop/model/usdcop.dart';
import 'package:com/user/model/user_model.dart';
import 'package:com/users/model/perfiles_model.dart';
import 'package:com/users/model/users_model.dart';
import 'package:com/versiones/model/versiones_model.dart';
import 'package:com/wbe/model/wbe_model.dart';
import 'package:flutter/material.dart';

import '../contrato/controller/contrato_action.dart';
import '../contrato/model/contrato_enum.dart';
import '../contrato/model/contratos_model.dart';
import '../historico/controller/historico_list_ctrl.dart';
import '../historico/model/historico_list_model.dart';
import '../preanalisis/controller/list_controller.dart';
import '../preorden/controller/doc_controller.dart';
import '../resumengeneral/model/resumengeneral_model.dart';
import '../resumenproveedor/controller/resumenproveedor_controller.dart';
import '../segodas/controller/segoda_controller.dart';
import '../segodas/controller/segodas_controller.dart';
import 'action_color.dart';
import 'action_load_data.dart';

part '../contrato/controller/contrato_events.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    // on<Load>(onLoad);
    on<Load>((ev, em) => onLoadData(ev, em, passState, add));
    on<NewMessage>(onNewMessage);
    on<Loading>(onLoading);
    on<ThemeChange>((ev, em) => onThemeChange(ev, em, passState));
    on<ThemeColorChange>((ev, em) => onThemeColorChange(ev, em, passState));
    on<Busqueda>((ev, em) => onBusqueda(ev, em, passState));
    on<ListLoadMore>((ev, em) => onListLoadMore(ev, em, passState));
    on<SeleccionarContratoPlanilla>(
        (ev, em) => onSeleccionarContratoPlanilla(ev, em, passState));
    on<CambiarContratoPlanilla>(
        (ev, em) => onCambiarContratoPlanilla(ev, em, passState));
    on<ResizeContratoPlanilla>(
        (ev, em) => onResizeContratoPlanilla(ev, em, passState));
    on<GuardarContratoPlanilla>(
        (ev, em) => onGuardarContratoPlanilla(ev, em, passState, add));
    on<AnularContratoPlanilla>(
        (ev, em) => onAnularContratoPlanilla(ev, em, passState, add));
  }
  MainState passState() => state;
  Bl bl() => Bl(emit, passState, add);

  SegOdaController get segOdaController =>
      SegOdaController(Bl(emit, passState, add));

  ResProveedorController get resProveedorController =>
      ResProveedorController(Bl(emit, passState, add));
  ResProyectoController get resProyectosController =>
      ResProyectoController(Bl(emit, passState, add));
  SegOdasController get segOdasController =>
      SegOdasController(Bl(emit, passState, add));
  PreanalisisListController get preanalisisListController =>
      PreanalisisListController(Bl(emit, passState, add));
  PreordenDocController get preordenDocController =>
      PreordenDocController(Bl(emit, passState, add));
  HistoricoListCtrl get historicoListCtrl =>
      HistoricoListCtrl(Bl(emit, passState, add));

  //Ui status on BLOC

  onNewMessage(event, emit) {
    emit(state.copyWith(
      message: event.message,
      messageCounter:
          event.typeMessage == TypeMessage.error ? 0 : state.messageCounter + 1,
      errorCounter:
          event.typeMessage == TypeMessage.error ? state.errorCounter + 1 : 0,
      messageColor: event.color,
    ));
  }

  onLoading(Loading event, emit) {
    emit(state.copyWith(
      isLoading: event.isLoading,
    ));
  }

  //------------------Especific Events ------------------

  void get usuarios {
    print(state.users!.usersList);
  }
}
