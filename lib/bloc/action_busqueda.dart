

import 'package:com/bloc/main_bloc.dart';

void onBusqueda(Busqueda event, emit, MainState Function() state) {
  switch (event.table) {
    case 'oe':
      state().oe!.buscar(event.value);
      break;
    default:
  }
  emit(state().copyWith());
}


