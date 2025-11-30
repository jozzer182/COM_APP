// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:com/listado_odas/model/listadoodas_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statistics/statistics.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/to_celda.dart';
import '../../resources/transicion_pagina.dart';
import '../../segodas/view/segoda_page.dart';
import '../model/listadoodas_fila.dart';

class ListadoOdasPage extends StatefulWidget {
  final String? filtroInicial;
  const ListadoOdasPage({
    this.filtroInicial,
    super.key,
  });

  @override
  State<ListadoOdasPage> createState() => _ListadoOdasPageState();
}

class _ListadoOdasPageState extends State<ListadoOdasPage> {
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
        title: const Text('LISTADO DE ODAS'),
        actions: [
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state.listadoOdas == null || firstTimeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                DateTime fecha = state.listadoOdas!.list.first.actualizado;
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
      floatingActionButton: BlocSelector<MainBloc, MainState, ListadoOdas?>(
        selector: (state) => state.listadoOdas,
        builder: (context, state) {
          if (state == null) {
            return const CircularProgressIndicator();
          } else {
            return FloatingActionButton(
              onPressed: () => DescargaHojas().ahora(
                datos: state.list,
                nombre: 'Listado de Odas',
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
              List<ToCelda> titles = state.listadoOdas!.titles;
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
                if (state.listadoOdas == null || firstTimeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                bool crearSeg = state.user!.permisos.contains('crear_seg');
                List<ListadoOdasFila> list = state.listadoOdas!.list;
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
                        for (ListadoOdasFila oda in list)
                          Builder(
                            builder: (context) {
                              void goTo(Widget page) =>
                                  Navigator.push(context, createRoute(page));
                              // bool pocoRestante = oda.porentregar > 0;
                              bool isLate =
                                  oda.fechaentrega.isBefore(DateTime.now());
                              Color? color = isLate ? Colors.grey[300] : null;
                              // color = pocoRestante ? Colors.yellow[300] : color;
                              action() {
                                context
                                    .read<MainBloc>()
                                    .segOdaController
                                    .nuevoOdaList(oda);
                                goTo(
                                  const SegOdaPage(
                                    esNuevo: true,
                                    vienedeOda: true,
                                  ),
                                );
                              }

                              return InkWell(
                                onTap: crearSeg ? () => action() : null,
                                onDoubleTap: crearSeg ? () => action() : null,
                                child: Container(
                                  color: color,
                                  child: Row(
                                    children: [
                                      for (ToCelda celda in oda.celdas)
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
                            },
                          ),
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
