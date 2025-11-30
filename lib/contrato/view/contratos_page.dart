import 'package:com/contrato/model/contratos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/transicion_pagina.dart';
import '../model/contrato_model.dart';
import 'contrato_page.dart';

class ContratoPage extends StatefulWidget {
  const ContratoPage({super.key});

  @override
  State<ContratoPage> createState() => _ContratoPageState();
}

class _ContratoPageState extends State<ContratoPage> {
  String filter = '';
  int endList = 70;
  final ScrollController _controller = ScrollController();
  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        endList += 70;
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información Contratos'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: BlocSelector<MainBloc, MainState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, state) {
              // print('called');
              return state ? const LinearProgressIndicator() : SizedBox();
            },
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.read<MainBloc>().add(
                    SeleccionarContratoPlanilla(
                      planilla: ContratoPlanilla.fromInit(),
                    ),
                  );
              goTo(
                const ContratoPlanillaPage(
                  esNuevo: true,
                ),
              );
            },
            child: const Text(
              'Nuevo\nContrato',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: BlocSelector<MainBloc, MainState, Contrato?>(
        selector: (state) => state.contrato,
        builder: (context, state) {
          return state == null
              ? const CircularProgressIndicator()
              : FloatingActionButton(
                  onPressed: () => DescargaHojas().ahora(
                      datos: state.contratoList,
                      nombre: 'Información Contratos'),
                  child: const Icon(Icons.download),
                );
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filter = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Búsqueda',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                List<ContratoSingle> contratoList = [];
                List<ContratoSingle> data = [];
                if (state.contrato != null) {
                  data = state.contrato!.contratoList
                      .map((e) => e.copyWith())
                      .toList();
                  contratoList = state.contrato!.contratoList
                      .where((el) => el.toList().any((e) =>
                          e.toLowerCase().contains(filter.toLowerCase())))
                      .toList();
                }
                if (contratoList.length > endList) {
                  contratoList = contratoList.sublist(0, endList);
                }
                return SingleChildScrollView(
                  controller: _controller,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      for (ContratoSingle contrato in contratoList)
                        Card(
                          child: ListTile(
                            title: SelectableText(
                                "${contrato.documentocompras} - ${contrato.material} - ${contrato.tipotcacontractual}"),
                            subtitle: SelectableText(
                                "Tiempo TCA: ${contrato.tiempocontractualdetcadias}, ET: ${contrato.etcontrato}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                context.read<MainBloc>().add(
                                      SeleccionarContratoPlanilla(
                                        planilla: ContratoPlanilla(
                                          contratoSingleList: [
                                            ...data
                                                .where((e) =>
                                                    e.documentocompras ==
                                                    contrato.documentocompras)
                                                .toList()
                                          ],
                                        ),
                                      ),
                                    );
                                goTo(
                                  const ContratoPlanillaPage(
                                    esNuevo: false,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
