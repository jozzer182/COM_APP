import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/main_bloc.dart';

class PreordenAgregarNotaMail extends StatelessWidget {
  const PreordenAgregarNotaMail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Nota para el correo'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Especifique la razón del cambio',
              border:  OutlineInputBorder(),
            ),
            onChanged: (value) => BlocProvider.of<MainBloc>(context)
                .preordenDocController
                .email
                .agregarNota(value),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
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
