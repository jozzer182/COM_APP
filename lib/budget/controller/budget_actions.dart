import 'package:supabase_flutter/supabase_flutter.dart' show SupabaseClient;

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/apis.dart';
import '../model/budget_model.dart';

// onLoadBudget(Bl bl) async {
//   var emit = bl.emit;
//   MainState Function() state = bl.state;
//   Budget budget = Budget();
//   try {
//     await budget.obtener();
//     emit(state().copyWith(budget: budget));
//   } catch (e) {
//     bl.errorCarga("Budget", e);
//   }
// }


class BudgetCtrl {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;

  BudgetCtrl(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    Budget budget = Budget();
    try {
      final supabaseClient = SupabaseClient(
        Api.femSamSupUrlNew,
        Api.femSamSupKeyNew,
      );
      final response = await supabaseClient.from('budget').select();
      for (var item in response) {
        budget.budgetList.add(BudgetSingle.fromMap(item));
      }
      budget.budgetListSearch = [...budget.budgetList];

      emit(state().copyWith(budget: budget));
    } catch (e) {
      bl.errorCarga("Budget", e);
    }
  }
}
