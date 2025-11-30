import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/env_config.dart';

class MailPage extends StatefulWidget {
  const MailPage({super.key});

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  bool _isSending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar Correo Informe'),
      ),
      body: Center(
        child: _isSending
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  Map<String, Object> dataSend = {'fname': "enviarInforme"};
                  setState(() {
                    _isSending = true;
                  });
                  print(jsonEncode(dataSend));
                  final response = await post(
                    Uri.parse(EnvConfig.apiMail),
                    body: jsonEncode(dataSend),
                  );
                  context
                      .read<MainBloc>()
                      .bl()
                      .mensajeFlotante(message: response.body.toString());
                  setState(() {
                    _isSending = false;
                  });
                },
                child: const Text('Enviar Correo'),
              ),
      ),
    );
  }
}
