// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:com/preanalisis/model/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/to_celda.dart';
import '../../resources/transicion_pagina.dart';
import '../model/reg_model.dart';
import 'cupocontrato_dialog.dart';

class PreanalisisListPage extends StatefulWidget {
  final String? filtroInicial;
  const PreanalisisListPage({
    this.filtroInicial,
    super.key,
  });

  @override
  State<PreanalisisListPage> createState() => _PreanalisisListPageState();
}

class _PreanalisisListPageState extends State<PreanalisisListPage> {
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
        return Scaffold(
          appBar: AppBar(
            title: const Text('PREANÁLISIS'),
            actions: [
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text(
              //     'NUEVA\nPREORDEN',
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // const Gap(5),
            ],
          ),
          floatingActionButton:
              BlocSelector<MainBloc, MainState, PreanalisisList?>(
            selector: (state) => state.preanalisisList,
            builder: (context, state) {
              if (state == null) {
                return const CircularProgressIndicator();
              } else {
                return FloatingActionButton(
                  onPressed: () => DescargaHojas().ahora(
                    datos: state.list,
                    nombre: 'Listado de Preanalisis',
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
                  List<ToCelda> titles = state.preanalisisList!.titles;
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
                    if (state.preanalisisList == null || firstTimeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<PreanalisisReg> list = state.preanalisisList!.list;
                    // print('ListadoContratos length: ${list.length}');
                    list = list
                        .where(
                          (e) => e.toList().any(
                                (ele) => ele.toLowerCase().contains(
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
                            for (PreanalisisReg preanalisis in list)
                              Builder(builder: (context) {
                                void goTo(Widget page) =>
                                    Navigator.push(context, createRoute(page));
                                bool posiblePreorden =
                                    preanalisis.disponibilidad < 0 &&
                                        preanalisis.cupo > 0;
                                bool noAlcanzaCupo = posiblePreorden &&
                                    preanalisis.disponibilidad +
                                            preanalisis.cupo <
                                        0;
                                bool necesidadsinCupo =
                                    preanalisis.disponibilidad < 0 &&
                                        preanalisis.cupo == 0;
                                Color? color =
                                    posiblePreorden ? Colors.green[100] : null;
                                color =
                                    noAlcanzaCupo ? Colors.yellow[100] : color;
                                color = necesidadsinCupo
                                    ? Colors.orange[50]
                                    : color;
                                action() {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupoContratoDialog(
                                        preanalisis: preanalisis,
                                      );
                                    },
                                  );
                                }

                                return InkWell(
                                  onTap: () => action(),
                                  onDoubleTap: () => action(),
                                  child: Container(
                                    color: color,
                                    child: Row(
                                      children: [
                                        for (ToCelda celda
                                            in preanalisis.celdas)
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
