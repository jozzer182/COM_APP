import 'package:bloc/bloc.dart';
import 'package:com/bloc/main_bloc.dart';
import 'package:com/resumengeneral/controller/resumengeneral_controller.dart';

import '../resumenanticipos/controller/resumenanticipos_controller.dart';
import '../resumengestor/controller/resumengestor_controller.dart';
import '../resumenproveedor/controller/resumenproveedor_controller.dart';
import '../resumenproyecto/controller/resumenproyecto_controller.dart';
import 'main__bl.dart';

Future onCalculateData(
  event,
  Emitter<MainState> emit,
  MainState Function() state,
  void Function(MainEvent) add,
) async {
  ResProveedorController(Bl(emit, state, add)).crear();
  await Future.delayed(const Duration(milliseconds: 100));
  ResProyectoController(Bl(emit, state, add)).crear();
  await Future.delayed(const Duration(milliseconds: 100));
  ResGeneralController(Bl(emit, state, add)).crear();
  await Future.delayed(const Duration(milliseconds: 100));
  ResAnticiposController(Bl(emit, state, add)).crear();
  await Future.delayed(const Duration(milliseconds: 100));
  ResGestorController(Bl(emit, state, add)).crear();
}


