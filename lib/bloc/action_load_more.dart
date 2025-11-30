

import 'package:com/bloc/main_bloc.dart';

onListLoadMore(event, emit, MainState Function() state) {
  switch (event.table) {
    case 'oe':
      state().oe!.view = state().oe!.view + 100;
      break;
    default:
  }
  emit(state().copyWith());
}
