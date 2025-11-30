import 'package:com/bloc/main_bloc.dart';
import 'package:com/preorden/model/doc_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../resources/card_pad.dart';
import '../../resources/column_exp.dart';
import '../../resources/field_pre_texto_v2.dart';
import '../controller/campo_controller.dart';
import '../model/reg_enum.dart';

class PreordenDocCard extends StatefulWidget {
  final int index;
  final bool updating;
  final bool editAllFields;
  const PreordenDocCard(
    this.index, {
    super.key,
    required this.updating,
    required this.editAllFields,
  });

  @override
  State<PreordenDocCard> createState() => _PreordenDocCardState();
}

class _PreordenDocCardState extends State<PreordenDocCard> {
  late int index;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.preordenList == null ||
            state.preordenDoc == null ||
            state.budget == null ||
            state.listadoPosiciones == null ||
            state.listadoContratos == null) {
          return const Center(child: CircularProgressIndicator());
        }
        bool isLoading = state.isLoading;
        PreordenDoc data = state.preordenDoc!;
        CampoPreordenController campo =
            context.read<MainBloc>().preordenDocController.campo;
        List<String> proyectos =
            state.budget!.budgetList.map((e) => e.proyecto).toSet().toList();
        List<String> e4es = state.listadoPosiciones!.list
            .where((e) =>
                e.e4e.length == 6 && e.contrato == data.list[index].contrato)
            .map((e) => '${e.e4e} | ${e.descripcion}')
            .toSet()
            .toList();
        List<String> wbes = state.wbe!.wbeList
            .where((e) => e.wbe.length == 22)
            .map((e) => '${e.wbe} | ${e.proyecto} | ${e.descripcion}')
            .toSet()
            .toList();
        // return Text(data.toString());
        return CardPad(
          child: Column(
            children: [
              Row(
                children: [
                  Text(data.list[index].pos),
                  const Gap(5),
                  ColumnExp(
                    flex: 2,
                    children: [
                      FieldTexto2(
                        size: 24,
                        initialValue: data.list[index].proyecto,
                        label: 'Proyecto',
                        edit: widget.editAllFields,
                        opciones: proyectos,
                        asignarValor: (String value) {
                          campo.cambiar(
                            campo: CampoPreorden.proyecto,
                            valor: value,
                            index: index,
                          );
                        },
                      ),
                      const Gap(5),
                      FieldTexto2(
                        size: 24,
                        initialValue: data.list[index].pm,
                        label: 'PM',
                        edit: widget.editAllFields,
                        asignarValor: (String value) {
                          campo.cambiar(
                            campo: CampoPreorden.pm,
                            valor: value,
                            index: index,
                          );
                        },
                      ),
                      const Gap(5),
                      FieldTexto2(
                        size: 24,
                        initialValue: data.list[index].portfolio,
                        label: 'Portfolio',
                        edit: widget.editAllFields,
                        asignarValor: (String value) {
                          campo.cambiar(
                            campo: CampoPreorden.portfolio,
                            valor: value,
                            index: index,
                          );
                        },
                      ),
                    ],
                  ),
                  const Gap(5),
                  ColumnExp(
                    flex: 2,
                    children: [
                      Row(
                        children: [
                          FieldTexto2(
                            size: 24,
                            flex: 1,
                            initialValue: data.list[index].e4e,
                            label: 'E4E',
                            opciones: e4es,
                            edit: widget.editAllFields,
                            asignarValor: (String value) {
                              campo.cambiar(
                                campo: CampoPreorden.e4e,
                                valor: value,
                                index: index,
                              );
                            },
                          ),
                          const Gap(5),
                          FieldTexto2(
                            size: 24,
                            flex: 4,
                            initialValue: data.list[index].descripcion,
                            label: 'Descripción',
                            edit: widget.editAllFields,
                            asignarValor: (String value) {
                              campo.cambiar(
                                campo: CampoPreorden.descripcion,
                                valor: value,
                                index: index,
                              );
                            },
                          ),
                        ],
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          FieldTexto2(
                            size: 24,
                            flex: 3,
                            initialValue: data.list[index].precio,
                            label: 'Precio',
                            edit: widget.editAllFields,
                            asignarValor: (String value) {
                              campo.cambiar(
                                campo: CampoPreorden.precio,
                                valor: value,
                                index: index,
                              );
                            },
                          ),
                          const Gap(5),
                          FieldTexto2(
                            size: 24,
                            flex: 2,
                            initialValue: data.list[index].moneda,
                            label: 'Moneda',
                            edit: widget.editAllFields,
                            asignarValor: (String value) {
                              campo.cambiar(
                                campo: CampoPreorden.moneda,
                                valor: value,
                                index: index,
                              );
                            },
                          ),
                          const Gap(5),
                          FieldTexto2(
                            size: 24,
                            flex: 1,
                            initialValue: data.list[index].um,
                            label: 'Um',
                            edit: widget.editAllFields,
                            asignarValor: (String value) {
                              campo.cambiar(
                                campo: CampoPreorden.um,
                                valor: value,
                                index: index,
                              );
                            },
                          ),
                        ],
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Tooltip(
                              message: data.list[index].femfecha,
                              child: FieldTexto2(
                                size: 24,
                                initialValue: data.list[index].femobservacion,
                                label: 'Observación FEM',
                                edit: widget.editAllFields,
                                asignarValor: (String value) {
                                  campo.cambiar(
                                    campo: CampoPreorden.femobservacion,
                                    valor: value,
                                    index: index,
                                  );
                                },
                              ),
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                            flex: 1,
                            child: Tooltip(
                              message: data.list[index].femid,
                              child: FieldTexto2(
                                size: 24,
                                initialValue: data.list[index].femctd,
                                label: 'Ctd FEM',
                                edit: widget.editAllFields,
                                asignarValor: (String value) {
                                  campo.cambiar(
                                    campo: CampoPreorden.femctd,
                                    valor: value,
                                    index: index,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(5),
                  ColumnExp(
                    children: [
                      FieldTexto2(
                        size: 60,
                        initialValue: data.list[index].ctd,
                        label: 'Ctd',
                        isNumber: true,
                        edit: widget.editAllFields,
                        asignarValor: (String value) {
                          campo.cambiar(
                            campo: CampoPreorden.ctd,
                            valor: value,
                            index: index,
                          );
                        },
                      )
                    ],
                  ),
                  const Gap(5),
                  ColumnExp(
                    flex: 2,
                    children: [
                      Row(
                        children: [
                          FieldTexto2(
                            size: 24,
                            flex: 1,
                            initialValue: data.list[index].femfecha,
                            label: 'Fechas FEM',
                            edit: widget.editAllFields,
                            asignarValor: (String value) {
                              campo.cambiar(
                                campo: CampoPreorden.femfecha,
                                valor: value,
                                index: index,
                              );
                            },
                          ),
                          const Gap(5),
                          Expanded(
                            child: Row(
                              children: [
                                FieldTexto2(
                                  size: 24,
                                  flex: 1,
                                  initialValue: data.list[index].wbe,
                                  color: data.list[index].wbe.isEmpty
                                      ? Colors.orange
                                      : null,
                                  opciones: wbes,
                                  label: 'WBE',
                                  edit: widget.editAllFields,
                                  asignarValor: (String value) {
                                    campo.cambiar(
                                      campo: CampoPreorden.wbe,
                                      valor: value,
                                      index: index,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: (isLoading || !widget.editAllFields)
                                      ? const SizedBox()
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(0),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          onPressed: () {
                                            context
                                                .read<MainBloc>()
                                                .preordenDocController
                                                .actualizarWBEs(
                                                    [data.list[index].femid]);
                                          },
                                          child: const Icon(
                                            Icons.repeat,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      FieldTexto2(
                        size: 24,
                        initialValue: data.list[index].proyectowbe,
                        color: data.list[index].proyectowbe.isEmpty
                            ? Colors.orange
                            : null,
                        label: 'Proyecto WBE',
                        edit: widget.editAllFields,
                        asignarValor: (String value) {
                          campo.cambiar(
                            campo: CampoPreorden.proyectowbe,
                            valor: value,
                            index: index,
                          );
                        },
                      ),
                      const Gap(5),
                      FieldTexto2(
                        size: 24,
                        initialValue: data.list[index].status,
                        color: data.list[index].status.isEmpty
                            ? Colors.orange
                            : null,
                        label: 'Status WBE',
                        edit: widget.editAllFields,
                        asignarValor: (String value) {
                          campo.cambiar(
                            campo: CampoPreorden.status,
                            valor: value,
                            index: index,
                          );
                        },
                      ),
                    ],
                  ),
                  const Gap(5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Tooltip(
                          message: data.list[index].estado,
                          child: Builder(builder: (context) {
                            IconData icon = Icons.abc;
                            Color color = Colors.red;
                            if (data.list[index].estado == 'Pend_ODA_WBE') {
                              icon = Icons.remove_shopping_cart;
                              color = Colors.red;
                            }
                            if (data.list[index].estado == 'Pend_ODA') {
                              icon = Icons.production_quantity_limits;
                              color = Colors.orange;
                            }
                            if (data.list[index].estado == 'Pend_WBE') {
                              icon = Icons.polyline;
                              color = Colors.orange;
                            }
                            if (data.list[index].estado == 'Completa') {
                              icon = Icons.done_outline;
                              color = Colors.green;
                            }
                            return Icon(
                              icon,
                              color: color,
                              size: 24,
                            );
                          }),
                        ),
                      ),

                      const Gap(20),
                      widget.editAllFields
                          ? ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  const Size(30, 25),
                                ), // Ajusta el tamaño aquí
                              ),
                              onPressed: () {
                                // PreordenDoc preordenDoc = state.preordenDoc!;
                                // if (preordenDoc.list.length > 1) {
                                //   preordenDoc.list.removeAt(index);
                                context
                                    .read<MainBloc>()
                                    .preordenDocController
                                    .quitarFilaEspecifica(index);
                                // }
                              },
                              child: const Text(
                                'Eliminar',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      const Gap(5),
                      // Row(
                      //   children: [
                      //     Text(data.list[index].enviadopm),

                      //   ],
                      // )
                    ],
                  ),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  const Gap(14),
                  FieldTexto2(
                    size: 24,
                    flex: 1,
                    initialValue: data.list[index].oda,
                    label: 'ODA',
                    edit: widget.editAllFields,
                    color: data.list[index].oda.isEmpty ? Colors.orange : null,
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.oda,
                        valor: value,
                        index: index,
                      );
                    },
                  ),
                  const Gap(5),
                  FieldTexto2(
                    size: 24,
                    flex: 1,
                    initialValue: data.list[index].odapos,
                    label: 'ODA Posición',
                    edit: widget.editAllFields,
                    color:
                        data.list[index].odapos.isEmpty ? Colors.orange : null,
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.odapos,
                        valor: value,
                        index: index,
                      );
                    },
                  ),
                  const Gap(5),
                  FieldTexto2(
                    size: 24,
                    flex: 5,
                    initialValue: data.list[index].observaciongeneral,
                    label: 'Observación General',
                    edit: widget.editAllFields,
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.observaciongeneral,
                        valor: value,
                        index: index,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
