import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/main_bloc.dart';
import '../../preorden/view/doc_page.dart';
import '../../resources/transicion_pagina.dart';
import '../model/reg_cupocontrato_model.dart';
import '../model/reg_model.dart';

class CupoContratoDialog extends StatefulWidget {
  final PreanalisisReg preanalisis;
  const CupoContratoDialog({
    required this.preanalisis,
    super.key,
  });

  @override
  State<CupoContratoDialog> createState() => _CupoContratoDialogState();
}

class _CupoContratoDialogState extends State<CupoContratoDialog> {
  late PreanalisisReg preanalisis;
  CupoContrato? cupoContratoSeleccionado;
  @override
  void initState() {
    preanalisis = widget.preanalisis;
    context
        .read<MainBloc>()
        .preanalisisListController
        .crearProyecto(preanalisis.e4e);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        bool crearPreorden = state.user!.permisos.contains('crear_preorden');
        return AlertDialog(
          title: const Text('Preorden'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${preanalisis.e4e} - ${preanalisis.descripcion}',
              ),
              Text(
                'Plataforma: ${preanalisis.plataforma} - OE: ${preanalisis.oe}',
              ),
              Text(
                'FEM: ${preanalisis.fem} - Otros: ${preanalisis.otros}',
              ),
              Text(
                'Ctd. Proyectos: ${state.preanalisisList!.proyectoList.list.length}',
              ),
              const Text(
                'Cupo - Contrato - Fin - Porcentaje Restante - Valor Unitario',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (CupoContrato cupoContrato in state
                  .preanalisisList!.cupocontratoList.list
                  .where((e) => e.e4e == preanalisis.e4e))
                InkWell(
                  onTap: () {
                    setState(() {
                      cupoContratoSeleccionado = cupoContrato;
                    });
                  },
                  child: Card(
                    color: cupoContratoSeleccionado == cupoContrato
                        ? Colors.blue[100]
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Builder(builder: (context) {
                        NumberFormat currencyFormat =
                            NumberFormat.simpleCurrency(
                          decimalDigits: 0,
                          locale: 'en_US',
                        );
                        return Tooltip(
                          message: cupoContrato.objeto,
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${cupoContrato.cupo}',
                                  style: TextStyle(
                                    color: cupoContrato.cupo > 1
                                        ? null
                                        : Colors.red,
                                    fontWeight: cupoContrato.cupo > 1
                                        ? null
                                        : FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(text: ' - '),
                                TextSpan(text: cupoContrato.contrato),
                                const TextSpan(text: ' - '),
                                TextSpan(
                                  text: cupoContrato.fin
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0],
                                ),
                                const TextSpan(text: ' - '),
                                TextSpan(
                                  text: '${cupoContrato.porcentajerestante}%',
                                ),
                                const TextSpan(text: ' - '),
                                TextSpan(
                                  text:
                                      '${currencyFormat.format(cupoContrato.valorunitario)}(${cupoContrato.moneda})',
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: cupoContratoSeleccionado == null || !crearPreorden
                  ? null
                  : () {
                      void goTo(Widget page) =>
                          Navigator.push(context, createRoute(page));

                      context
                          .read<MainBloc>()
                          .preordenDocController
                          .crearPreAnalisis(
                            state.preanalisisList!.proyectoList.list,
                            preanalisis,
                            cupoContratoSeleccionado!,
                          );
                      goTo(
                        const PreordenDocPage(
                          esNuevo: true,
                        ),
                      );
                    },
              child: const Text('Crear Preorden'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
