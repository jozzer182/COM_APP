// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:com/listado_contratos/model/listadocontrato.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statistics/statistics.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/to_celda.dart';
import '../../resources/transicion_pagina.dart';
import '../model/listadocontrato_fila.dart';

class ListadoContratosPage extends StatefulWidget {
  final String? filtroInicial;
  const ListadoContratosPage({
    this.filtroInicial,
    super.key,
  });

  @override
  State<ListadoContratosPage> createState() => _ListadoContratosPageState();
}

class _ListadoContratosPageState extends State<ListadoContratosPage> {
  String filter = '';
  int endList = 70;
  bool firstTimeLoading = true;
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
    if (widget.filtroInicial != null) {
      filter = widget.filtroInicial!;
    }
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        firstTimeLoading = false;
      });
    });
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTADO DE CONTRATOS'),
        actions: [
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state.listadoContratos == null || firstTimeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                DateTime fecha = state.listadoContratos!.list.first.actualizado;
                return Center(
                  child: Text(
                    'Actualizado:' +
                        '\n${fecha.day.toStringPadded(2)}/${fecha.month.toStringPadded(2)}/${fecha.year}' +
                        '\n${fecha.hour.toStringPadded(2)}:${fecha.minute.toStringPadded(2)}',
                    textAlign: TextAlign.center,
                  ),
                );
              }
            },
          ),
          const Gap(5),
        ],
      ),
      floatingActionButton:
          BlocSelector<MainBloc, MainState, ListadoContratos?>(
        selector: (state) => state.listadoContratos,
        builder: (context, state) {
          if (state == null) {
            return const CircularProgressIndicator();
          } else {
            return FloatingActionButton(
              onPressed: () => DescargaHojas().ahora(
                datos: state.list,
                nombre: 'Listado de Contratos',
              ),
              child: const Icon(Icons.download),
            );
          }
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
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
              ],
            ),
          ),
          const Gap(5),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              List<ToCelda> titles = state.listadoContratos!.titles;
              return Row(
                children: [
                  for (ToCelda celda in titles)
                    Expanded(
                      flex: celda.flex,
                      child: Text(
                        celda.valor,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const Gap(5),
          Expanded(
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                if (state.listadoContratos == null || firstTimeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<ListadoContratosFila> list = state.listadoContratos!.list;
                // print('ListadoContratos length: ${list.length}');
                list = list
                    .where(
                      (e) => e.toList().any(
                            (el) => el.toLowerCase().contains(
                                  filter.toLowerCase(),
                                ),
                          ),
                    )
                    .toList();
                if (list.length > endList) {
                  list = list.sublist(0, endList);
                }
                return SingleChildScrollView(
                  controller: _controller,
                  child: SelectableRegion(
                    focusNode: FocusNode(),
                    selectionControls: emptyTextSelectionControls,
                    child: Column(
                      children: [
                        for (ListadoContratosFila contrato in list)
                          Builder(builder: (context) {
                            void goTo(Widget page) =>
                                Navigator.push(context, createRoute(page));
                            bool pocoRestante = (contrato.valorrestante /
                                    contrato.valorprevisto) <
                                0.1;
                            bool isLate = contrato.diasrestantes < 30 || pocoRestante;
                            Color? color = isLate ? Colors.yellow[100] : null;
                            action() {
                              // context
                              //     .read<MainBloc>()
                              //     .segOdaController
                              //     .nuevo(contrato);
                              // goTo(SegOdaPage(
                              //   esNuevo: false,
                              //   vienedeOda: true,
                              // ));
                            }

                            return InkWell(
                              onTap: isLate ? null : () => action(),
                              onDoubleTap: isLate ? null : () => action(),
                              child: Container(
                                color: color,
                                child: Row(
                                  children: [
                                    for (ToCelda celda in contrato.celdas)
                                      Expanded(
                                        flex: celda.flex,
                                        child: Text(
                                          celda.valor,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      ],
                    ),
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
