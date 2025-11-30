import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (loading)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                List<Map<String, dynamic>> datos = await context
                    .read<MainBloc>()
                    .historicoListCtrl
                    .obtenerMapYear("2024");
                DescargaHojas().ahoraMap(
                  datos: datos,
                  nombre: "SEGUIMIENTO ODAS 2024",
                );
                setState(() {
                  loading = false;
                });
              },
              child: const Text('2024'),
            ),
        ],
      )),
    );
  }
}
