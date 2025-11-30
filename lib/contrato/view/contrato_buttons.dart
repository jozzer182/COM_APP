import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';

import '../../bloc/main_bloc.dart';

// class ButtonEditar extends StatelessWidget {
//   final Function edit;
//   final bool esNuevo;
//   const ButtonEditar({
//     required this.edit,
//     required this.esNuevo,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainBloc, MainState>(
//       builder: (context, state) {
//         bool contratoEdit = state.user!.permisos.contains("estados_contrato");
//         Estados estados = context.watch<MainBloc>().state.planilla!.estados;
//         bool buttonEnabled = contratoEdit && !esNuevo &&
//             estados.estado_enel != 'aprobado' &&
//             estados.estado_enel != 'saperror';
//         if (!buttonEnabled) return const SizedBox();
//         return ElevatedButton(
//           onPressed: () {
//             edit();
//           },
//           child: const Text('Editar todo'),
//         );
//       },
//     );
//   }
// }

class ButtonControlRows extends StatefulWidget {
  const ButtonControlRows({
    super.key,
    required this.rowsController,
    required this.edit,
  });

  final bool edit;
  final TextEditingController rowsController;

  @override
  State<ButtonControlRows> createState() => _ButtonControlRowsState();
}

class _ButtonControlRowsState extends State<ButtonControlRows>
    with TickerProviderStateMixin {
  // Replace FlutterGifController with GifController
  late GifController controller;

  @override
  void initState() {
    controller = GifController();
    // No need for post frame callback with gif_view
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.edit) {
      return const SizedBox();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // BottonPasteExcel(controller: controller),
        // const SizedBox(width: 10),
        // BottonShowGif(controller: controller),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              context.read<MainBloc>().add(
                    ResizeContratoPlanilla(
                      ctd: 1,
                      metodo: 'agregar',
                    ),
                  );
            },
            child: const Icon(Icons.add)),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              context.read<MainBloc>().add(
                    ResizeContratoPlanilla(
                      ctd: 1,
                      metodo: 'eliminar',
                    ),
                  );
            },
            child: const Icon(Icons.remove)),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          height: 30,
          child: TextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: widget.rowsController,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              labelText: '# Filas',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              context.read<MainBloc>().add(
                    ResizeContratoPlanilla(
                      ctd: int.parse(widget.rowsController.text),
                      metodo: 'resize',
                    ),
                  );
            },
            child: const Text('Aplicar')),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              context.read<MainBloc>().add(
                    ResizeContratoPlanilla(
                      ctd: 1,
                      metodo: 'reset',
                    ),
                  );
            },
            child: const Text('Reset'))
      ],
    );
  }
}

// class BottonPasteExcel extends StatelessWidget {
//   final GifController controller; // Updated to use GifController
//   final String tabla = 'planilla';
//   BottonPasteExcel({
//     required this.controller,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: const Text('Pegar datos de Excel'),
//       onPressed: () async {
//         final clipboardData = await Clipboard.getData('text/plain');
//         String? data = clipboardData?.text;
//         RegExp numbersOnly = RegExp(r'^[0-9]+$');
//         // print(data);
//         // print(data!.isEmpty);
//         // Analizar los datos copiados y asignar los valores correspondientes a cada campo
//         if (data != null &&
//             data.isNotEmpty &&
//             numbersOnly.hasMatch(data.replaceAll(RegExp(r'\s+'), ''))) {
//           final rows = data.split('\n').map((e) => e.trim()).toList();
//           rows.removeWhere((e) => e.isEmpty);
//           // if (rows.length > nuevoIngresoList.length) {
//           context.read<MainBloc>().add(
//                 ResizeContratoPlanilla(
//                   ctd: rows.length.toString(),
//                   metodo: 'resize',
//                   table: tabla,
//                 ),
//               );
//           await Future.delayed(
//             const Duration(milliseconds: 100),
//           );
//           // }
//           for (var i = 0; i < data.length; i++) {
//             if (i < rows.length) {
//               final values = rows[i].split('\t').map((e) => e.trim()).toList();
//               context.read<MainBloc>().add(
//                     ChangePlanillaList(
//                       ctd: i,
//                       tabla: tabla,
//                       e4e: values[0],
//                     ),
//                   );
//               await Future.delayed(
//                 const Duration(milliseconds: 100),
//               );
//               context.read<MainBloc>().add(
//                     ChangePlanillaList(
//                       ctd: i,
//                       tabla: tabla,
//                       ctd_e: values[1],
//                     ),
//                   );
//               await Future.delayed(
//                 const Duration(milliseconds: 100),
//               );
//               context.read<MainBloc>().add(
//                     ChangePlanillaList(
//                       ctd: i,
//                       tabla: tabla,
//                       ctd_r: values[2],
//                     ),
//                   );
//               await Future.delayed(
//                 const Duration(milliseconds: 100),
//               );
//             }
//           }
//           // print(rows);
//         } else {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 content: SizedBox(
//                   width: 500,
//                   child: GifView.asset( // Updated to use GifView.asset
//                     'images/exampleplanilla.gif',
//                     controller: controller,
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class BottonShowGif extends StatelessWidget {
//   final GifController controller; // Updated to use GifController
//   BottonShowGif({
//     required this.controller,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: const Text('?'),
//       onPressed: () async {
//         await showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: SizedBox(
//                 width: 500,
//                 child: GifView.asset( // Updated to use GifView.asset
//                   'images/exampleplanilla.gif',
//                   controller: controller,
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
