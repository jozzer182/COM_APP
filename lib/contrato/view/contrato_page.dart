import 'package:com/contrato/model/contrato_enum.dart';
import 'package:com/contrato/model/contratos_model.dart';
import 'package:com/contrato/view/contrato_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../../version.dart';
import 'contrato_fields_v2.dart';

class ContratoPlanillaPage extends StatefulWidget {
  final bool esNuevo;
  const ContratoPlanillaPage({
    required this.esNuevo,
    super.key,
  });

  @override
  State<ContratoPlanillaPage> createState() => _ContratoPlanillaPageState();
}

class _ContratoPlanillaPageState extends State<ContratoPlanillaPage> {
  TextEditingController rowsController = TextEditingController();
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
    Color primaryColor = Theme.of(context).colorScheme.primary;
    TextStyle titleMedium = Theme.of(context).textTheme.titleMedium!.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w900,
        );

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
              Version.status('Contrato Planilla', '$runtimeType'),
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ],
      appBar: AppBar(
        title: const Text('Contrato Planilla'),
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Anular Contrato Planilla'),
                        content: const Text(
                            '¿Está seguro que desea anular el contrato planilla?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<MainBloc>().add(
                                    AnularContratoPlanilla(
                                      user: context.read<MainBloc>().state.user!,
                                    ),
                                  );
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text('Anular'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Anular',
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const SizedBox();
          }),
          const SizedBox(width: 10),
          Builder(builder: (context) {
            if (!widget.esNuevo) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    editAllFields = !editAllFields;
                  });
                },
                child: const Text(
                  'Editar',
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const SizedBox();
          }),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              if (context.read<MainBloc>().state.contratoPlanilla!.validar(
                        contrato: context.read<MainBloc>().state.contrato!,
                        esNuevo: widget.esNuevo,
                      ) !=
                  null) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: Text(
                        context
                            .read<MainBloc>()
                            .state
                            .contratoPlanilla!
                            .validar(
                              contrato:
                                  context.read<MainBloc>().state.contrato!,
                              esNuevo: widget.esNuevo,
                            )!
                            .join('\n'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                context.read<MainBloc>().add(
                      GuardarContratoPlanilla(
                        esNuevo: widget.esNuevo,
                        user: context.read<MainBloc>().state.user!,
                      ),
                    );
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Guardar',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state.contratoPlanilla == null ||
              state.contrato == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ContratoSingle> data =
              state.contratoPlanilla!.contratoSingleListEdit;
          List<ContratoSingle> contrato = state.contrato!.contratoList;
          // List<SapSingle> sap = state.sap!.sapSingleList;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedRow(
                  children: [
                    FieldPre(
                      flex: 4,
                      initialValue: data[0].documentocompras,
                      campo: CampoContratoPlanilla.documentocompras,
                      label: 'Contrato',
                      color: data[0].documentocompras.isEmpty ||
                              contrato.any((e) =>
                                  e.documentocompras ==
                                  data[0].documentocompras)
                          ? Colors.red
                          : Colors.green,
                      edit: editAllFields,
                      tipoCampo: TipoCampo.texto,
                      // opciones: sap
                      //     .where((e) => !contrato.any((el) =>
                      //         e.documentocompras == el.documentocompras))
                      //     .map((e) => e.documentocompras)
                      //     .toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ButtonControlRows(
                  rowsController: rowsController,
                  edit: editAllFields,
                ),
                const SizedBox(height: 10),
                SizedCard(
                  children: [
                    const Text("-"),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "A todos\nlos Items",
                        textAlign: TextAlign.center,
                        style: titleMedium.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    FieldPre(
                      flex: 2,
                      initialValue:
                          data[0].tiempocontractualdeprimeranetregadias,
                      campo: CampoContratoPlanilla
                          .tiempocontractualdeprimeranetregadias,
                      label: 'Tiempo Contractual de Primera Entrega (días)',
                      color:
                          data[0].tiempocontractualdeprimeranetregadias.isEmpty
                              ? Colors.red
                              : Colors.green,
                      edit: editAllFields,
                      tipoCampo: TipoCampo.texto,
                      isNumber: true,
                    ),
                    const SizedBox(width: 10),
                    FieldPre(
                      flex: 2,
                      initialValue: data[0].tiempocontractualdetcadias,
                      campo: CampoContratoPlanilla.tiempocontractualdetcadias,
                      label: 'Tiempo Contractual de TC (días)',
                      color: data[0].tiempocontractualdetcadias.isEmpty
                          ? Colors.red
                          : Colors.green,
                      edit: editAllFields,
                      tipoCampo: TipoCampo.texto,
                      isNumber: true,
                    ),
                    const SizedBox(width: 10),
                    FieldPre(
                      flex: 2,
                      initialValue: data[0].tipotcacontractual,
                      campo: CampoContratoPlanilla.tipotcacontractual,
                      label: 'Tipo TCA Contractual',
                      color: data[0].tipotcacontractual.isEmpty
                          ? Colors.red
                          : Colors.green,
                      edit: editAllFields,
                      tipoCampo: TipoCampo.desplegable,
                      opciones: const ['NA', 'FIRST', 'SECOND', 'THIRD'],
                    ),
                    const SizedBox(width: 10),
                    FieldPre(
                      flex: 2,
                      initialValue: data[0].etcontrato,
                      campo: CampoContratoPlanilla.etcontrato,
                      label: 'ET Contrato',
                      color: data[0].etcontrato.isEmpty
                          ? Colors.red
                          : Colors.green,
                      edit: editAllFields,
                      tipoCampo: TipoCampo.texto,
                    ),
                    const SizedBox(width: 10),
                    FieldPre(
                      flex: 2,
                      initialValue: data[0].versionetcontrato,
                      campo: CampoContratoPlanilla.versionetcontrato,
                      label: 'Versión ET Contrato',
                      color: data[0].versionetcontrato.isEmpty
                          ? Colors.red
                          : Colors.green,
                      edit: editAllFields,
                      tipoCampo: TipoCampo.texto,
                    ),
                    const SizedBox(width: 10),
                    FieldPre(
                      flex: 2,
                      initialValue: data[0].tendercode,
                      campo: CampoContratoPlanilla.tendercode,
                      label: 'Tender Code',
                      color: data[0].tendercode.isEmpty
                          ? Colors.red
                          : Colors.green,
                      edit: editAllFields,
                      tipoCampo: TipoCampo.texto,
                    ),
                    const SizedBox(width: 10),
                    FieldPre(
                      flex: 2,
                      initialValue: data[0].tiepogarantiameses,
                      campo: CampoContratoPlanilla.tiepogarantiameses,
                      label: 'Tiempo Garantía (meses)',
                      color: data[0].tiepogarantiameses.isEmpty
                          ? Colors.red
                          : Colors.green,
                      edit: editAllFields,
                      isNumber: true,
                      tipoCampo: TipoCampo.texto,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                for (ContratoSingle item in data)
                  SizedCard(
                    children: [
                      Text(item.item.toString(), style: titleMedium),
                      const SizedBox(width: 10),
                      Builder(builder: (context) {
                        Color color = Colors.red;
                        if (item.material.isNotEmpty &&
                            data
                                    .where((e) => e.material == item.material)
                                    .length ==
                                1 &&
                            item.material.length == 6) {
                          color = Colors.green;
                        }
                        return FieldPre(
                          flex: 2,
                          initialValue: item.material,
                          campo: CampoContratoPlanilla.material,
                          label: 'Material',
                          color: color,
                          edit: editAllFields,
                          tipoCampo: TipoCampo.texto,
                          isNumber: true,
                          item: item.item - 1,
                        );
                      }),
                      const SizedBox(width: 10),
                      FieldPre(
                        flex: 2,
                        initialValue:
                            item.tiempocontractualdeprimeranetregadias,
                        campo: CampoContratoPlanilla
                            .tiempocontractualdeprimeranetregadias,
                        label: 'Tiempo Contractual de Primera Entrega (días)',
                        color:
                            item.tiempocontractualdeprimeranetregadias.isEmpty
                                ? Colors.red
                                : Colors.green,
                        edit: editAllFields,
                        tipoCampo: TipoCampo.texto,
                        isNumber: true,
                        item: item.item - 1,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        flex: 2,
                        initialValue: item.tiempocontractualdetcadias,
                        campo: CampoContratoPlanilla.tiempocontractualdetcadias,
                        label: 'Tiempo Contractual de TC (días)',
                        color: item.tiempocontractualdetcadias.isEmpty
                            ? Colors.red
                            : Colors.green,
                        edit: editAllFields,
                        tipoCampo: TipoCampo.texto,
                        isNumber: true,
                        item: item.item - 1,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        flex: 2,
                        initialValue: item.tipotcacontractual,
                        campo: CampoContratoPlanilla.tipotcacontractual,
                        label: 'Tipo TCA Contractual',
                        color: item.tipotcacontractual.isEmpty
                            ? Colors.red
                            : Colors.green,
                        edit: editAllFields,
                        tipoCampo: TipoCampo.desplegable,
                        opciones: const ['NA', 'FIRST', 'SECOND', 'THIRD'],
                        item: item.item - 1,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        flex: 2,
                        initialValue: item.etcontrato,
                        campo: CampoContratoPlanilla.etcontrato,
                        label: 'ET Contrato',
                        color:
                            item.etcontrato.isEmpty ? Colors.red : Colors.green,
                        edit: editAllFields,
                        tipoCampo: TipoCampo.texto,
                        item: item.item - 1,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        flex: 2,
                        initialValue: item.versionetcontrato,
                        campo: CampoContratoPlanilla.versionetcontrato,
                        label: 'Versión ET Contrato',
                        color: item.versionetcontrato.isEmpty
                            ? Colors.red
                            : Colors.green,
                        edit: editAllFields,
                        tipoCampo: TipoCampo.texto,
                        item: item.item - 1,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        flex: 2,
                        initialValue: item.tendercode,
                        campo: CampoContratoPlanilla.tendercode,
                        label: 'Tender Code',
                        color:
                            item.tendercode.isEmpty ? Colors.red : Colors.green,
                        edit: editAllFields,
                        tipoCampo: TipoCampo.texto,
                        item: item.item - 1,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        flex: 2,
                        initialValue: item.tiepogarantiameses,
                        campo: CampoContratoPlanilla.tiepogarantiameses,
                        label: 'Tiempo Garantía (meses)',
                        color: item.tiepogarantiameses.isEmpty
                            ? Colors.red
                            : Colors.green,
                        edit: editAllFields,
                        isNumber: true,
                        tipoCampo: TipoCampo.texto,
                        item: item.item - 1,
                      ),
                    ],
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SizedRow extends StatelessWidget {
  final List<Widget> children;
  const SizedRow({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: children,
      ),
    );
  }
}

class SizedCard extends StatelessWidget {
  final List<Widget> children;
  const SizedCard({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          child: Row(
            children: children,
          ),
        ),
      ),
    );
  }
}
