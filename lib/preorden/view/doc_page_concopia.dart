import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../bloc/main_bloc.dart';
import 'doc_page_destinatarios.dart';

class EmailConCopia extends StatefulWidget {
  final Destino destino;
  const EmailConCopia({
    required this.destino,
    super.key,
  });

  @override
  State<EmailConCopia> createState() => _EmailConCopiaState();
}

class _EmailConCopiaState extends State<EmailConCopia> {
  TextEditingController controller = TextEditingController();
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  @override
  void initState() {
    BlocProvider.of<MainBloc>(context)
        .preordenDocController
        .email
        .initConCopia;

    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        List<String> destinatarios = state.preordenDoc!.conCopia;
        bool valido = regex.hasMatch(controller.text);
        return AlertDialog(
          title: const Text('Con Copia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Especifique las personas con copia del cambio'),
              const Gap(10),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // height: 100,
                    width: 300,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Correo destinatario a agregar',
                        border: const OutlineInputBorder(),
                        errorText: valido
                            ? null
                            : 'Debe ser un correo electrónico válido',
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: valido
                        ? () {
                            BlocProvider.of<MainBloc>(context)
                                .preordenDocController
                                .email
                                .agregarConCopia(controller.text);
                            controller.clear();
                          }
                        : null,
                    child: const Text('Agregar'),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                width: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: destinatarios.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(destinatarios[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<MainBloc>(context)
                              .preordenDocController
                              .email
                              .quitarConCopia(destinatarios[index]);
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: destinatarios.isNotEmpty
                  ? () {
                      Navigator.pop(context, true);
                    }
                  : null,
              child: const Text('Guardar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
