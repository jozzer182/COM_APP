// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:com/fem/model/list_model.dart';
import 'package:com/fem/model/reg_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/to_celda.dart';
import '../../resources/transicion_pagina.dart';

class FemListPage extends StatefulWidget {
  final String? filtroInicial;
  const FemListPage({
    this.filtroInicial,
    super.key,
  });

  @override
  State<FemListPage> createState() => _FemListPageState();
}

class _FemListPageState extends State<FemListPage> {
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
          appBar: AppBar(title: const Text('FICHAS')),
          floatingActionButton: BlocSelector<MainBloc, MainState, FemList?>(
            selector: (state) => state.femList,
            builder: (context, state) {
              if (state == null) {
                return const CircularProgressIndicator();
              } else {
                return FloatingActionButton(
                  onPressed: () => DescargaHojas().ahora(
                    datos: state.list,
                    nombre: 'Fichas',
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
                  List<ToCelda> titles = state.femList!.titles;
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
                    if (state.femList == null || firstTimeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<FemReg> list = state.femList!.list;
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
                            for (FemReg femReg in list)
                              Builder(builder: (context) {
                                void goTo(Widget page) =>
                                    Navigator.push(context, createRoute(page));
                                bool isCero = femReg.total == 0;
                                // bool pocoRestante = preorden.porentregar > 0;
                                // bool isLate =
                                //     oda.fechaentrega.isBefore(DateTime.now());
                                Color? color = isCero ? Colors.grey[300] : null;
                                Color? colorTexto = isCero ? Colors.grey[600] : null;
                                // color = pocoRestante ? Colors.yellow[300] : color;
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
                                  // onTap: isLate ? null : () => action(),
                                  // onDoubleTap: isLate ? null : () => action(),
                                  child: Container(
                                    color: color,
                                    child: Row(
                                      children: [
                                        for (ToCelda celda in femReg.celdas)
                                          Expanded(
                                            flex: celda.flex,
                                            child: Text(
                                              celda.valor,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: colorTexto,
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
