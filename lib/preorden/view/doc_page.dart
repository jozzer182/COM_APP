// ignore_for_file: use_build_context_synchronously

import 'package:com/preorden/controller/campo_controller.dart';
import 'package:com/preorden/model/doc_model.dart';
import 'package:com/preorden/model/reg_enum.dart';
import 'package:com/preorden/view/doc_page_card.dart';
import 'package:com/preorden/view/doc_page_concopia.dart';
import 'package:com/resources/body_single.dart';
import 'package:com/resources/future_group_add.dart';
import 'package:com/resources/sized_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statistics/statistics.dart';
import '../../bloc/main_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/field_pre_texto_v2.dart';
import '../../version.dart';
import 'doc_page_destinatarios.dart';
import 'doc_page_guardar_comentario.dart';
import 'doc_page_nota.dart';

class PreordenDocPage extends StatefulWidget {
  final bool esNuevo;
  const PreordenDocPage({
    required this.esNuevo,
    super.key,
  });

  @override
  State<PreordenDocPage> createState() => _PreordenDocPageState();
}

class _PreordenDocPageState extends State<PreordenDocPage> {
  bool updating = false;
  bool editAllFields = false;
  @override
  void initState() {
    if (widget.esNuevo) {
      editAllFields = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.preordenList == null &&
            state.preordenDoc == null &&
            state.listadoContratos == null &&
            state.oe == null) {
          return const Center(child: CircularProgressIndicator());
        }
        CampoPreordenController campo =
            context.read<MainBloc>().preordenDocController.campo;
        PreordenDoc data = state.preordenDoc!;
        bool isLoading = state.isLoading;
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
                  Version.status('Pre Orden', '$runtimeType'),
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ],
          appBar: AppBar(
            title: const Text('PRE ÓRDEN'),
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
              Builder(builder: (context) {
                if (!widget.esNuevo) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        editAllFields = !editAllFields;
                        if (!editAllFields) {
                          Navigator.pop(context);
                        }
                      });
                    },
                    child: Text(
                      editAllFields ? 'Cancelar' : 'Editar',
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return const SizedBox();
              }),
              const SizedBox(width: 10),
              if (editAllFields)
                ElevatedButton(
                  onPressed: () async {
                    // bool comentSent =

                    bool? deseaContinuar = await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return const PreordenAgregarComentarioGuardar();
                      },
                    );
                    if (deseaContinuar == true) {
                      context.read<MainBloc>().preordenDocController.guardar;
                      while (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text(
                    'Guardar',
                    textAlign: TextAlign.center,
                  ),
                ),
              const Gap(10),
            ],
          ),
          body: BodySingle(
            children: [
              SizedRow(
                children: [
                  FieldTexto2(
                    flex: 2,
                    initialValue: data.list[0].preorden,
                    label: 'PREORDEN',
                    asignarValor: (String value) {},
                  ),
                  const Gap(10),
                  FieldTexto2(
                    flex: 3,
                    initialValue: data.list[0].contrato,
                    label: 'Contrato',
                    edit: editAllFields,
                    opciones: state.listadoContratos!.list
                        .map((e) => '${e.contrato} | ${e.sintetico}')
                        .toList(),
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.contrato,
                        valor: value,
                        index: -1,
                      );
                    },
                  ),
                  const Gap(10),
                  FieldTexto2(
                    flex: 3,
                    initialValue: data.list[0].gestor,
                    label: 'Gestor',
                    edit: editAllFields,
                    opciones: state.oe!.oeList.map((e) => e.usuario).toList(),
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.gestor,
                        valor: value,
                        index: -1,
                      );
                    },
                  ),
                  const Gap(10),
                  FieldTexto2(
                    flex: 2,
                    initialValue: data.list[0].fecha,
                    label: 'Fecha',
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.fecha,
                        valor: value,
                        index: 0,
                      );
                    },
                  ),
                ],
              ),
              SizedRow(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Tooltip(
                          message: data.list[0].enviadopm,
                          child: Checkbox(
                            value: data.list[0].enviadopm.startsWith('enviado'),
                            onChanged: null,
                          ),
                        ),
                        const Gap(10),
                        (isLoading || widget.esNuevo || editAllFields)
                            ? const Text('Email PM')
                            : ElevatedButton(
                                onPressed: () async {
                                  bool? deseaContinuar = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return const EmailDestinatarios(
                                        destino: Destino.pm,
                                      );
                                    },
                                  );

                                  if (deseaContinuar != true) {
                                    return;
                                  }

                                  deseaContinuar = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return const EmailConCopia(
                                        destino: Destino.pm,
                                      );
                                    },
                                  );

                                  if (deseaContinuar != true) {
                                    return;
                                  }

                                  deseaContinuar = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return const PreordenAgregarNotaMail();
                                    },
                                  );

                                  if (deseaContinuar != true) {
                                    return;
                                  }

                                  campo.cambiar(
                                    campo: CampoPreorden.enviadopm,
                                    valor:
                                        'enviado el ${DateTime.now()} por ${state.user!.correo.toUpperCase()}',
                                    index: -1,
                                  );
                                  while (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }
                                  FutureGroupDelayed fg = FutureGroupDelayed();
                                  fg.add(
                                    context
                                        .read<MainBloc>()
                                        .preordenDocController
                                        .guardar,
                                  );
                                  fg.addF(
                                    context
                                        .read<MainBloc>()
                                        .preordenDocController
                                        .email
                                        .enviarPM,
                                  );
                                  fg.close();
                                  await fg.future;
                                },
                                child: const Text('Email PM'),
                              ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Tooltip(
                          message: data.list[0].enviadogestor,
                          child: Checkbox(
                            value:
                                data.list[0].enviadogestor.startsWith('enviado'),
                            onChanged: null,
                          ),
                        ),
                        const Gap(10),
                        (isLoading || widget.esNuevo || editAllFields)
                            ? const Text('Email Gestor')
                            : ElevatedButton(
                                onPressed: () async {
                                  bool? deseaContinuar = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return const EmailDestinatarios(
                                        destino: Destino.gestor,
                                      );
                                    },
                                  );
                                  if (deseaContinuar != true) {
                                    return;
                                  }

                                  deseaContinuar = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return const EmailConCopia(
                                        destino: Destino.gestor,
                                      );
                                    },
                                  );

                                  if (deseaContinuar != true) {
                                    return;
                                  }

                                  deseaContinuar = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return const PreordenAgregarNotaMail();
                                    },
                                  );

                                  if (deseaContinuar != true) {
                                    return;
                                  }
                                  campo.cambiar(
                                    campo: CampoPreorden.enviadogestor,
                                    valor:
                                        'enviado el ${DateTime.now()} por ${state.user!.correo.toUpperCase()}',
                                    index: -1,
                                  );
                                  while (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }
                                  FutureGroupDelayed fg = FutureGroupDelayed();
                                  fg.add(
                                    context
                                        .read<MainBloc>()
                                        .preordenDocController
                                        .guardar,
                                  );
                                  fg.addF(
                                    context
                                        .read<MainBloc>()
                                        .preordenDocController
                                        .email
                                        .enviarGestor,
                                  );
                                  fg.close();
                                  await fg.future;
                                },
                                child: const Text('Email Gestor'),
                              ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    flex: 3,
                    child: isLoading || !editAllFields
                        ? const SizedBox()
                        : ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MainBloc>()
                                  .preordenDocController
                                  .actualizarWBEs(
                                    data.list.map((e) => e.femid).toList(),
                                  );
                            },
                            child: const Text(
                              'Actualizar WBEs desde FEM',
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                  const Gap(10),
                  FieldTexto2(
                    flex: 3,
                    initialValue: data.list[0].oda,
                    label: 'ODA',
                    edit: editAllFields,
                    color: data.list.all((element) => element.oda.isEmpty)
                        ? Colors.orange
                        : null,
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.oda,
                        valor: value,
                        index: -1,
                      );
                    },
                  ),
                  const Gap(10),
                  FieldTexto2(
                    flex: 1,
                    initialValue: data.list[0].odapos,
                    label: 'ODA Posición',
                    edit: editAllFields,
                    color: data.list.all((element) => element.odapos.isEmpty)
                        ? Colors.orange
                        : null,
                    asignarValor: (String value) {
                      campo.cambiar(
                        campo: CampoPreorden.odapos,
                        valor: value,
                        index: -1,
                      );
                    },
                  ),
                ],
              ),
              const Gap(10),
              isLoading || !editAllFields
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<MainBloc>()
                                .preordenDocController
                                .agregarFila;
                          },
                          child: const Icon(Icons.add),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<MainBloc>()
                                .preordenDocController
                                .quitarFila;
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
              const Gap(10),
              // Text(data.list.length.toString()),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.list.length,
                itemBuilder: (context, index) {
                  return PreordenDocCard(
                    index,
                    updating: updating,
                    editAllFields: editAllFields,
                  );
                  // return Text(index.toString());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
