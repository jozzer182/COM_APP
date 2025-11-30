// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:com/preorden/model/list_model.dart';
import 'package:com/preorden/view/doc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/to_celda.dart';
import '../../resources/transicion_pagina.dart';
import '../model/doc_model.dart';

class PreordenListpage extends StatefulWidget {
  final String? filtroInicial;
  const PreordenListpage({
    this.filtroInicial,
    super.key,
  });

  @override
  State<PreordenListpage> createState() => _PreordenListpageState();
}

class _PreordenListpageState extends State<PreordenListpage> {
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
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        bool crearPreorden = state.user!.permisos.contains('crear_preorden');
        return Scaffold(
          appBar: AppBar(
            title: const Text('PREORDENES'),
            actions: [
              if (crearPreorden)
                ElevatedButton(
                  onPressed: () {
                    context.read<MainBloc>().preordenDocController.crear;
                    Navigator.push(context,
                        createRoute(const PreordenDocPage(esNuevo: true)));
                  },
                  child: const Text(
                    'NUEVA\nPREORDEN',
                    textAlign: TextAlign.center,
                  ),
                ),
              const Gap(5),
            ],
          ),
          floatingActionButton:
              BlocSelector<MainBloc, MainState, PreordenList?>(
            selector: (state) => state.preordenList,
            builder: (context, state) {
              if (state == null) {
                return const CircularProgressIndicator();
              } else {
                return FloatingActionButton(
                  onPressed: () => DescargaHojas().ahora(
                    datos: state.registros,
                    nombre: 'Listado de Preordenes',
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
                  List<ToCelda> titles = state.preordenList!.titles;
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
                    if (state.preordenList == null || firstTimeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<PreordenDoc> list = state.preordenList!.list;
                    // print('ListadoContratos length: ${list.length}');
                    list = list
                        .where(
                          (e) => e.list.toList().any(
                                (el) => el.toList().any(
                                      (ele) => ele.toLowerCase().contains(
                                            filter.toLowerCase(),
                                          ),
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
                            for (PreordenDoc preorden in list)
                              Builder(builder: (context) {
                                void goTo(Widget page) =>
                                    Navigator.push(context, createRoute(page));
                                // bool pocoRestante = preorden.porentregar > 0;
                                // bool isLate =
                                //     oda.fechaentrega.isBefore(DateTime.now());
                                // Color? color = isLate ? Colors.grey[300] : null;
                                // color = pocoRestante ? Colors.yellow[300] : color;
                                action() {
                                  context
                                      .read<MainBloc>()
                                      .preordenDocController
                                      .seleccionar(preorden);
                                  goTo(
                                    const PreordenDocPage(
                                      esNuevo: false,
                                    ),
                                  );
                                }

                                return InkWell(
                                  onTap: () => action(),
                                  onDoubleTap: () => action(),
                                  child: Container(
                                    // color: color,
                                    child: Row(
                                      children: [
                                        for (ToCelda celda in preorden.celdas)
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
      },
    );
  }
}
