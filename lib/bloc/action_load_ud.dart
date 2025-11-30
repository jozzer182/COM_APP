import 'package:com/bloc/main__bl.dart';
import 'package:com/oe/controller/oe_actions.dart';
import 'package:com/segodas/controller/segodas_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../budget/controller/budget_actions.dart';
import '../contrato/controller/contrato_action.dart';
import '../eurcop/controller/eurcop_action.dart';
import '../fem/controller/list_controller.dart';
import '../historico/controller/historico_list_ctrl.dart';
import '../listado_contratos/controller/listadocontrato_controller.dart';
import '../listado_odas/controller/listadoodas_controller.dart';
import '../listado_posiciones/controller/listadoposiciones_controller.dart';
import '../plataforma/controller/plataforma_actions.dart';
import '../preanalisis/controller/list_controller.dart';
import '../preorden/controller/list_controller.dart';
import '../resources/future_group_add.dart';
import '../usdcop/controller/usdcop_action.dart';
import '../user/controller/user_action.dart';
import '../versiones/controller/versiones_actions.dart';
import '../wbe/controller/wbe_actions.dart';
import 'action_load_calculated.dart';
import 'main_bloc.dart';

Future onLoadUserData(
  Load event,
  emit,
  MainState Function() state,
  void Function(MainEvent) add,
) async {
  emit(state().copyWith(isLoading: true));
  // print(FirebaseAuth.instance.currentUser?.email);

  if (FirebaseAuth.instance.currentUser?.email != null &&
      state().users != null) {
    await onCreateUser(event, emit, state);
    if (state().user != null) {
      FutureGroupDelayed futureMaster = FutureGroupDelayed();
      FutureGroupDelayed futureGroup1 = FutureGroupDelayed();
      FutureGroupDelayed futureGroup2 = FutureGroupDelayed();
      futureMaster.addF(onLoadUsdcop(event, emit, state));
      futureMaster.addF(onLoadEurcop(event, emit, state));
      futureMaster.addF(onLoadContrato(event, emit, state));
      // futureMaster.addF(onLoadBudget(Bl(emit, state, add)));
      futureMaster.addF(onLoadWbe(Bl(emit, state, add)));
      futureMaster.addF(PreordenListController(Bl(emit, state, add)).obtener);
      futureMaster.addF(BudgetCtrl(Bl(emit, state, add)).obtener);
      futureGroup1.addF(SegOdasController(Bl(emit, state, add)).obtener);
      futureGroup1.close();
      futureMaster.addF(futureGroup1.future.then((value) {
        onCalculateData(event, emit, state, add);
      }));
      futureGroup2.addF(OeController(Bl(emit, state, add)).obtener);
      futureGroup2
          .addF(ListadoContratoController(Bl(emit, state, add)).obtener);
      futureGroup2
          .addF(ListadoPosicionesController(Bl(emit, state, add)).obtener);
      futureGroup2.addF(ListadoOdasController(Bl(emit, state, add)).obtener);
      futureGroup2.addF(FemListController(Bl(emit, state, add)).obtener);
      futureGroup2.addF(HistoricoListCtrl(Bl(emit, state, add)).obtener);
      futureGroup2.addF(VersionesCtrl(Bl(emit, state, add)).obtener);
      futureGroup2.addF(onLoadPlataforma(Bl(emit, state, add)));
      // futureGroup2.addF(onLoadVersiones(Bl(emit, state, add)));
      futureGroup2.close();
      futureMaster.addF(futureGroup2.future.then((value) {
        PreanalisisListController(Bl(emit, state, add)).crear;
      }));
      // futureGroup.add(onLoadSapmlms(event, emit, state));
      // futureGroup.add(onLoadPap(event, emit, state));
      futureMaster.close();
      try {
        await futureMaster.future.then((value) {
          emit(state().copyWith());
        }).whenComplete(() async {
          //espera 1 segundo
          await Future.delayed(const Duration(seconds: 1));
          fixPrecioneto(Bl(emit, state, add));
          // PreanalisisListController(Bl(emit, state, add)).crear;
          // await onCalculateData(event, emit, state, add);
        });
      } on Exception catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    }
  }
  // print('state().users.usersList: ${state().users!.usersList}');
  emit(state().copyWith(isLoading: false));
}
