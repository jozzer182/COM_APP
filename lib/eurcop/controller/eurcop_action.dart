

import '../../bloc/main_bloc.dart';
import '../model/eurcop_model.dart';

Future onLoadEurcop(event, emit, MainState Function() state) async {
  Eurcop eurcop = Eurcop();
  try {
    // print('onLoadLm');
    await eurcop.obtener();
    emit(state().copyWith(eurcop: eurcop));
    // print('onLoadEurcop eurcop: ${state().eurcop?.close}');
  } catch (e) {
    emit(state().copyWith(
      errorCounter: state().errorCounter + 1,
      message:
          '🤕Error llamando📞 la tabla de Usuarios ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
    ));
  }
}
