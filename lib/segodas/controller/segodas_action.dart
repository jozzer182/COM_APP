// import 'package:bloc/bloc.dart';
// import 'package:com/bloc/main_bloc.dart';
// import 'package:com/segodas/model/segodas_model.dart';

// onLoadSegOdas(
//   event,
//   Emitter<MainState> emit,
//   MainState Function() state,
// ) async {
//   SegOdas segOdas = SegOdas();
//   try {
//     await segOdas.obtener();
//     emit(state().copyWith(segOdas: segOdas));
//     // print('plataforma: ${state().plataforma?.plataformaListSearch[0]}');
//   } catch (e) {
//     // print(e);
//     emit(state().copyWith(
//       errorCounter: state().errorCounter + 1,
//       message:
//           '🤕Error llamando📞 la tabla de datos Seguimiento de ODA ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
//     ));
//   }
// }

// // onSeleccionarSegOda(
// //   event,
// //   Emitter<MainState> emit,
// //   MainState Function() state,
// // ) async {
// //   state().segOda = event.segOda;
// //   emit(state().copyWith(segOda: event.segOda));
// // }
