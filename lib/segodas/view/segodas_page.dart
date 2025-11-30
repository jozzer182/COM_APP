import 'package:com/bloc/main_bloc.dart';
import 'package:com/resources/a_entero_2.dart';
import 'package:com/resources/descarga_hojas.dart';
import 'package:com/resources/field_pre_texto.dart';
import 'package:com/resources/to_celda.dart';
import 'package:com/resources/transicion_pagina.dart';
import 'package:com/version.dart';
import 'package:com/segodas/model/segoda_model.dart';
import 'package:com/segodas/model/segodas_model.dart';
import 'package:com/segodas/view/segoda_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../model/segoda_enum.dart';

class SegOdasPage extends StatefulWidget {
  const SegOdasPage({super.key});

  @override
  State<SegOdasPage> createState() => _SegOdasPageState();
}

class _SegOdasPageState extends State<SegOdasPage> {
  String filter = '';
  String gestor = '';
  String mes = '';
  bool verDinero = false;
  bool modificar = false;
  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.user == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<SegOda> segOdasList = state.segOdas?.segOdasList ?? [];
        List<SegOda> segOdasListSearch = state.segOdas?.segOdasListSearch
                .where((e) => e
                    .toList()
                    .any((e) => e.toLowerCase().contains(filter.toLowerCase())))
                .where((e) =>
                    e.gestor.toLowerCase().contains(gestor.toLowerCase()))
                .where((e) => mes.isEmpty? true :
                    e.mesequipo.toLowerCase() == mes.toLowerCase())
                .toList() ??
            [];
        List<SegOda> segOdasListModified =
            state.segOdas?.segOdasListModified ?? [];
        SegOdas segOdas = state.segOdas ?? SegOdas();
        List<String> meses = segOdasList
            .where((e) => e.gestor.toLowerCase().contains(gestor.toLowerCase()))
            .where((e) => e.mesequipo.isNotEmpty)
            .map((e) => e.mesequipo)
            .toSet()
            .toList();
        meses.sort((a, b) => aEntero(a) - aEntero(b));
        List<String> gestores =
            segOdasList.map((e) => e.gestor).toSet().toList();
        gestores.sort();

        bool crearSeg = state.user!.permisos.contains('crear_seg');
        bool modListaSeg = state.user!.permisos.contains('mod_lista_seg');
        // print('meses: $meses');
        return Scaffold(
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Version.data,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  Version.status('Conciliaciones', '$runtimeType'),
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ],
          appBar: AppBar(
            title: Text(
                'SEGUIMIENTO ÓRDENES DE ENTREGA ${verDinero ? "(Millones de Pesos)" : ""}'),
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
              if (modificar)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<MainBloc>().segOdasController.enviar();
                  },
                  child: const Text(
                    'Guardar',
                    textAlign: TextAlign.center,
                  ),
                ),
              const Gap(10),
              if (gestor.isNotEmpty && mes.isNotEmpty)
                if (modListaSeg)
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<MainBloc>()
                          .segOdasController
                          .setList(segOdasListSearch);
                      setState(() {
                        modificar = !modificar;
                        verDinero = true;
                      });
                    },
                    child: Text(
                      modificar ? 'Cancelar' : 'Modificar',
                      textAlign: TextAlign.center,
                    ),
                  ),
              const Gap(10),
              if (!modificar)
                Row(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       verDinero = !verDinero;
                    //     });
                    //   },
                    //   child: const Text(
                    //     'A Dinero',
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    const Gap(10),
                    if (crearSeg)
                      ElevatedButton(
                        onPressed: () {
                          context.read<MainBloc>().segOdaController.nuevo(null);
                          goTo(
                            SegOdaPage(
                              esNuevo: true,
                            ),
                          );
                        },
                        child: const Text(
                          'Nuevo\nSeguimiento',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const Gap(10),
                  ],
                ),
            ],
          ),
          floatingActionButton: BlocSelector<MainBloc, MainState, SegOdas?>(
            selector: (state) => state.segOdas,
            builder: (context, state) {
              return state == null
                  ? const CircularProgressIndicator()
                  : FloatingActionButton(
                      onPressed: () => DescargaHojas().ahoraMap(
                          datos: state.segOdasList
                              .map((e) => e.toMapInt())
                              .toList(),
                          nombre: 'Seguimiento Ordenes de entrega'),
                      child: const Icon(Icons.download),
                    );
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (!modificar)
                  Row(
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
                      const Gap(10),
                      FieldTexto(
                        flex: 3,
                        edit: true,
                        label: 'Gestor',
                        initialValue: gestor,
                        asignarValor: (value) {
                          setState(() {
                            gestor = value;
                            mes = '';
                          });
                        },
                        opciones: gestores,
                      ),
                      const Gap(10),
                      FieldTexto(
                        flex: 3,
                        edit: true,
                        label: 'mes',
                        initialValue: mes,
                        asignarValor: (value) {
                          setState(() {
                            mes = value;
                          });
                        },
                        opciones: meses,
                      ),
                    ],
                  ),
                Row(
                  children: [
                    if (verDinero)
                      for (ToCelda celda in segOdas.titlesDinero)
                        Expanded(
                          flex: celda.flex,
                          child: Text(
                            celda.valor,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                    else
                      for (ToCelda celda in segOdas.titlesDinero)
                        Expanded(
                          flex: celda.flex,
                          child: Text(
                            celda.valor,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 4),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: segOdasListSearch.length,
                          itemBuilder: (context, index) {
                            action() {
                              if (!modificar) {
                                context
                                    .read<MainBloc>()
                                    .segOdaController
                                    .seleccionar(segOdasListSearch[index]);
                                goTo(
                                  SegOdaPage(
                                    esNuevo: false,
                                  ),
                                );
                              }
                            }

                            // if (filter.isNotEmpty) {
                            //   print('index: $index');
                            //   print(
                            //       'segOdasListSearch: ${segOdasListSearch[index]}');
                            // }
                            List<ToCelda> celdas =
                                segOdasListSearch[index].celdasDinero;
                            if (verDinero) {
                              celdas = segOdasListSearch[index].celdasDinero;
                            }
                            if (modificar) {
                              celdas = segOdasListModified[index].celdasDinero;
                            }
                            bool activo = segOdasListSearch[index].observaciones1
                                .toUpperCase()
                                .contains('PENDIENTE') ||
                                segOdasListSearch[index].observaciones1.isEmpty;
                            return InkWell(
                              onDoubleTap: () => action(),
                              onTap: () => action(),
                              child: Container(
                                color: activo
                                    ? null
                                    : Colors.grey[300],
                                child: Row(
                                  children: [
                                    for (ToCelda celda in celdas)
                                      Expanded(
                                        flex: celda.flex,
                                        child: Builder(
                                          builder: (context) {
                                            if (modificar && celda.editar) {
                                              String id =
                                                  segOdasListSearch[index].id;
                                              CampoSegOda campo =
                                                  CampoSegOda.mesequipo;
                                              if (celda.campo == 'mesanticipos') {
                                                campo = CampoSegOda.mesanticipos;
                                              }
                                              if (celda.campo ==
                                                  'observaciones1') {
                                                campo =
                                                    CampoSegOda.observaciones1;
                                              }
                                              return FieldTexto(
                                                flex: null,
                                                size: 18,
                                                edit: true,
                                                label: '',
                                                // isNumber: true,
                                                initialValue: celda.valor,
                                                asignarValor: (value) {
                                                  context
                                                      .read<MainBloc>()
                                                      .segOdasController
                                                      .modifyList(
                                                        campo: campo,
                                                        valor: value,
                                                        id: id,
                                                      );
                                                },
                                              );
                                              // return TextField();
                                            }
                                            return Text(
                                              celda.valor,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: activo
                                                    ? celda.colorFuente
                                                    : Colors.grey[600],
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardSegOda extends StatelessWidget {
  final SegOda segOda;
  const CardSegOda({
    required this.segOda,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return InkWell(
      onTap: () {
        // print('SegOda: enviada');
        context.read<MainBloc>().segOdaController.seleccionar(segOda);
        goTo(
          SegOdaPage(
            esNuevo: false,
          ),
        );
      },
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "${segOda.documentocompras} - ${segOda.proyecto} - ${segOda.proveedor}",
                  textAlign: TextAlign.center,
                  // style: Theme.of(context).textTheme.headline6,
                ),
                // Text(
                //   segOda.descripcion,
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(fontSize: 10),
                // ),
                // Text(
                //   segOda.gestorcontrato,
                //   textAlign: TextAlign.center,
                //   // style: Theme.of(context).textTheme.subtitle1,
                // ),
                // Text(
                //   segOda.fechainco,
                //   textAlign: TextAlign.center,
                //   // style: Theme.of(context).textTheme.subtitle2,
                // ),
                // Text(
                //   segOda.estado,
                //   textAlign: TextAlign.center,
                //   // style: Theme.of(context).textTheme.subtitle2,
                // ),
              ],
            )),
      ),
    );
  }
}
