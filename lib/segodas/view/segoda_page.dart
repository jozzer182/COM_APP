import 'package:com/bloc/main_bloc.dart';
import 'package:com/oe/model/oe_model.dart';
import 'package:com/resources/toCurrency.dart';
import 'package:com/version.dart';
import 'package:com/segodas/model/segoda_enum.dart';
import 'package:com/segodas/view/segoda_fields_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../contrato/view/contrato_page.dart';
import '../../resources/body_single.dart';
import '../model/segoda_model.dart';

class SegOdaPage extends StatefulWidget {
  final bool esNuevo;
  final bool vienedeOda;
  const SegOdaPage({
    required this.esNuevo,
    this.vienedeOda = false,
    super.key,
  });

  @override
  State<SegOdaPage> createState() => _SegOdaPageState();
}

class _SegOdaPageState extends State<SegOdaPage> {
  late Future<String> id;
  bool editAllFields = false;
  @override
  void initState() {
    // id = context.read<MainBloc>().state.segOda!.lastNumberReg;
    //limpiar la planilla para enviar una nueva en caso de que sea nuevo
    if (widget.esNuevo || widget.vienedeOda) {
      editAllFields = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.segOda == null && state.segOdas == null && state.oe == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<OeSingle> odas = state.oe!.oeList;
        SegOda data = state.segOda!;
        // print('SegOda: $data');
        List<SegOda> segOdas = state.segOdas!.segOdasList;
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
                  Version.status('Seg Odas', '$runtimeType'),
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ],
          appBar: AppBar(
            title: const Text('SEGUIMIENTO ÓRDENES DE ENTREGA'),
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
                            title: const Text('Eliminar'),
                            content: const Text(
                                '¿Está seguro que desea eliminar este registro?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<MainBloc>()
                                      .segOdaController
                                      .borrar(widget.esNuevo);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('Eliminar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Eliminar',
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
                  onPressed: () {
                    List<String> errores =
                        context.read<MainBloc>().segOdaController.validar();
                    if (errores.isEmpty) {
                      context
                          .read<MainBloc>()
                          .segOdaController
                          .guardar(widget.esNuevo);
                      // print(Navigator.defaultRouteName);
                      // Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Por favor revise los siguientes campos:'),
                                Text(errores.join(',\n')),
                              ],
                            ),
                          );
                        },
                      );
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
                  FieldPre(
                    flex: 4,
                    initialValue: data.contrato,
                    campo: CampoSegOda.contrato,
                    label: 'Contrato',
                    color: data.contratoColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.contrato).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 4,
                    initialValue: data.documentocompras,
                    campo: CampoSegOda.documentocompras,
                    label: 'Documento Compras',
                    color: data.documentocomprasColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                    opciones: odas.map((e) => e.po).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: data.posicion,
                    campo: CampoSegOda.posicion,
                    label: 'Posición',
                    color: data.posicionColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.posicion).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 4,
                    initialValue: data.fechadocumento,
                    campo: CampoSegOda.fechadocumento,
                    label: 'Fecha Documento',
                    color: data.fechadocumentoColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.fecha,
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 8,
                    initialValue: data.proveedor,
                    campo: CampoSegOda.proveedor,
                    label: 'Proveedor',
                    color: data.proveedorColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.proveedor).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  FieldPre(
                    flex: 8,
                    initialValue: data.proyecto,
                    campo: CampoSegOda.proyecto,
                    label: 'Proyecto',
                    color: data.proyectoColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.proyecto).toList(),
                  ),
                  const SizedBox(width: 10),
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.bdg2024,
                  //   campo: CampoSegOda.bdg2024,
                  //   label: 'BDG 2024',
                  //   color: data.bdg2024Color,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.texto,
                  //   opciones: segOdas.map((e) => e.bdg2024).toList(),
                  // ),
                  // const SizedBox(width: 10),
                  // FieldPre(
                  //   flex: 6,
                  //   initialValue: data.wbe,
                  //   campo: CampoSegOda.wbe,
                  //   label: 'WBE',
                  //   color: data.wbeColor,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.texto,
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  FieldPre(
                    flex: 2,
                    initialValue: data.material,
                    campo: CampoSegOda.material,
                    label: 'Material',
                    color: data.materialColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.material).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 8,
                    initialValue: data.textobreve,
                    campo: CampoSegOda.textobreve,
                    label: 'Texto Breve',
                    color: data.textobreveColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.textobreve).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: data.unidadmedida,
                    campo: CampoSegOda.unidadmedida,
                    label: 'Unidad d Medida',
                    color: data.unidadmedidaColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.unidadmedida).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  FieldPre(
                    flex: 2,
                    initialValue: data.cantidaddepedido,
                    campo: CampoSegOda.cantidaddepedido,
                    label: 'Cantidad de Pedido',
                    color: data.cantidaddepedidoColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                  ),
                  // const SizedBox(width: 3),
                  // const Text(
                  //   '-',
                  //   style: TextStyle(fontSize: 18, color: Colors.blue),
                  // ),
                  // const SizedBox(width: 3),
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.conformado,
                  //   campo: CampoSegOda.conformado,
                  //   label: 'Conformado',
                  //   color: data.conformadoColor,
                  //   edit: editAllFields,
                  //   isNumber: true,
                  //   tipoCampo: TipoCampo.texto,
                  //   // opciones: segOdas.map((e) => e.conformado).toList(),
                  // ),
                  // const SizedBox(width: 3),
                  // const Text(
                  //   '=',
                  //   style: TextStyle(fontSize: 18, color: Colors.blue),
                  // ),
                  const SizedBox(width: 3),
                  FieldPre(
                    flex: 2,
                    initialValue: data.saldo,
                    campo: CampoSegOda.saldo,
                    label: 'Saldo',
                    color: data.saldoColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                    // opciones: segOdas.map((e) => e.saldo).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: data.moneda,
                    campo: CampoSegOda.moneda,
                    label: 'Moneda',
                    color: data.monedaColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.moneda).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue:
                        editAllFields ? data.tasa : toCurrency$(data.tasa),
                    campo: CampoSegOda.precioneto,
                    label: 'Tasa',
                    color: data.tasaColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                    // opciones: segOdas.map((e) => e.precioneto).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 3,
                    initialValue: editAllFields
                        ? data.precioneto
                        : toCurrency$(data.precioneto),
                    campo: CampoSegOda.precioneto,
                    label: 'Precio Neto',
                    color: data.precionetoColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                    // opciones: segOdas.map((e) => e.precioneto).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const TituloSecc('Proyección'),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  FieldPre(
                    flex: 2,
                    initialValue: editAllFields
                        ? data.valornetodepedido
                        : toCurrency$(data.valornetodepedido),
                    campo: CampoSegOda.valornetodepedido,
                    label: 'Valor Neto de Pedido',
                    color: data.valornetodepedidoColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: editAllFields
                        ? data.subtotalcop
                        : toCurrency$(data.subtotalcop),
                    campo: CampoSegOda.subtotalcop,
                    label: 'Subtotal COP',
                    color: data.subtotalcopColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: editAllFields
                        ? data.ivagastosnacionalizacion
                        : toCurrency$(data.ivagastosnacionalizacion),
                    campo: CampoSegOda.ivagastosnacionalizacion,
                    label: 'Iva Gastos Nacionalizacion',
                    color: data.ivagastosnacionalizacionColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 1,
                    initialValue: data.factorivanac,
                    campo: CampoSegOda.factorivanac,
                    label: 'Factor',
                    color: data.factorivanacColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedRow(children: [
                FieldPre(
                  flex: 2,
                  initialValue: editAllFields
                      ? data.valortotalcop
                      : toCurrency$(data.valortotalcop),
                  campo: CampoSegOda.valortotalcop,
                  label: 'Valor Total COP',
                  color: data.valortotalcopColor,
                  edit: editAllFields,
                  isNumber: true,
                  tipoCampo: TipoCampo.texto,
                ),
                const SizedBox(width: 3),
                const Text(
                  '-',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(width: 3),
                FieldPre(
                  flex: 2,
                  initialValue: editAllFields
                      ? data.vrpagado
                      : toCurrency$(data.vrpagado),
                  campo: CampoSegOda.vrpagado,
                  label: 'Vr Pagado',
                  color: data.vrpagadoColor,
                  edit: editAllFields,
                  isNumber: true,
                  tipoCampo: TipoCampo.texto,
                  // opciones: segOdas.map((e) => e.conformado).toList(),
                ),
                const SizedBox(width: 3),
                const Text(
                  '-',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(width: 3),
                FieldPre(
                  flex: 2,
                  initialValue: editAllFields
                      ? data.valoranticipo1
                      : toCurrency$(data.valoranticipo1),
                  campo: CampoSegOda.valoranticipo1,
                  label: 'Valor Anticipo',
                  color: data.valoranticipo1Color,
                  edit: editAllFields,
                  isNumber: true,
                  tipoCampo: TipoCampo.texto,
                ),
                const SizedBox(width: 3),
                const Text(
                  '=',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(width: 3),
                FieldPre(
                  flex: 2,
                  initialValue: editAllFields
                      ? data.saldopendiente
                      : toCurrency$(data.saldopendiente),
                  campo: CampoSegOda.saldopendiente,
                  label: 'Saldo Pendiente',
                  color: data.saldopendienteColor,
                  edit: editAllFields,
                  isNumber: true,
                  tipoCampo: TipoCampo.texto,
                ),
              ]),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.fechaconformidad,
                  //   campo: CampoSegOda.fechaconformidad,
                  //   label: 'Fecha Conformidad',
                  //   color: data.fechaconformidadColor,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.fecha,
                  // ),
                  // const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: data.mesequipo,
                    campo: CampoSegOda.mesequipo,
                    label: 'Mes Equipo',
                    color: data.mesequipoColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: data.mesanticipos,
                    campo: CampoSegOda.mesanticipos,
                    label: 'Mes Anticipo',
                    color: data.mesanticiposColor,
                    edit: editAllFields,
                    isNumber: true,
                    tipoCampo: TipoCampo.texto,
                  ),
                  // const SizedBox(width: 10),
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.nopdp,
                  //   campo: CampoSegOda.nopdp,
                  //   label: '# PDP',
                  //   color: data.nopdpColor,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.texto,
                  //   opciones: segOdas.map((e) => e.nopdp).toList(),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              const TituloSecc('General'),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  FieldPre(
                    flex: 2,
                    initialValue: data.gestor,
                    campo: CampoSegOda.gestor,
                    label: 'Gestor',
                    color: data.gestorColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.gestor).toList(),
                  ),
                  // const SizedBox(width: 10),
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.ou,
                  //   campo: CampoSegOda.ou,
                  //   label: 'OU',
                  //   color: data.ouColor,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.texto,
                  //   opciones: segOdas.map((e) => e.ou).toList(),
                  // ),
                  // const SizedBox(width: 10),
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.familia,
                  //   campo: CampoSegOda.familia,
                  //   label: 'Familia',
                  //   color: data.familiaColor,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.texto,
                  //   opciones: segOdas.map((e) => e.familia).toList(),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  FieldPre(
                    flex: 2,
                    initialValue: data.fechadeentregaincoterm,
                    campo: CampoSegOda.fechadeentregaincoterm,
                    label: 'Fecha Entrega Incoterm',
                    color: data.fechadeentregaincotermColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.fecha,
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: data.incoterm,
                    campo: CampoSegOda.incoterm,
                    label: 'Incoterm',
                    color: data.incotermColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.incoterm).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 6,
                    initialValue: data.puerto,
                    campo: CampoSegOda.puerto,
                    label: 'Puerto',
                    color: data.puertoColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.puerto).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedRow(
                children: [
                  FieldPre(
                    flex: 6,
                    initialValue: data.observaciones1,
                    campo: CampoSegOda.observaciones1,
                    label: 'OBSERVACIONES 1',
                    color: data.observaciones1Color,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.observaciones1).toList(),
                  ),
                  const SizedBox(width: 10),
                  FieldPre(
                    flex: 6,
                    initialValue: data.observaciones2,
                    campo: CampoSegOda.observaciones2,
                    label: 'OBSERVACIONES 2',
                    color: data.observaciones2Color,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.texto,
                    opciones: segOdas.map((e) => e.observaciones2).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const TituloSecc('Contrato'),
              const SizedBox(height: 10),
              // SizedRow(
              //   children: [
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechafirmadelcontratodecontrato,
              //       campo: CampoSegOda.fechafirmadelcontratodecontrato,
              //       label: 'Fecha firma del contrato',
              //       color: data.fechafirmadelcontratodecontratoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechafinalizacioncontrato,
              //       campo: CampoSegOda.fechafinalizacioncontrato,
              //       label: 'Fecha finalización Contrato',
              //       color: data.fechafinalizacioncontratoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechaactadeinicio,
              //       campo: CampoSegOda.fechaactadeinicio,
              //       label: 'Fecha Acta Inicio',
              //       color: data.fechaactadeinicioColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // SizedRow(
              //   children: [
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.tiemposdetcadias,
              //       campo: CampoSegOda.tiemposdetcadias,
              //       label: 'Tiempos de TCA',
              //       color: data.tiemposdetcadiasColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones: segOdas.map((e) => e.tiemposdetcadias).toList(),
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.tiemposdeentregadias,
              //       campo: CampoSegOda.tiemposdeentregadias,
              //       label: 'Tiempos de Entrega',
              //       color: data.tiemposdeentregadiasColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones:
              //           segOdas.map((e) => e.tiemposdeentregadias).toList(),
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechaentregaoda,
              //       campo: CampoSegOda.fechaentregaoda,
              //       label: 'Fecha Entrega',
              //       color: data.fechaentregaodaColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // const TituloSecc('Hitos'),
              // const SizedBox(height: 10),
              // SizedRow(
              //   children: [
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechaaprobaciondisenos,
              //       campo: CampoSegOda.fechaaprobaciondisenos,
              //       label: 'Fecha Aprobación disenos',
              //       color: data.fechaaprobaciondisenosColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.hitodisenocumplido,
              //       campo: CampoSegOda.hitodisenocumplido,
              //       label: 'Hito Diseño Cumplido',
              //       color: data.hitodisenocumplidoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones: segOdas.map((e) => e.hitodisenocumplido).toList(),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // SizedRow(
              //   children: [
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.retiesino,
              //       campo: CampoSegOda.retiesino,
              //       label: 'Retie',
              //       color: data.retiesinoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones: segOdas.map((e) => e.retiesino).toList(),
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.vigenciaretie,
              //       campo: CampoSegOda.vigenciaretie,
              //       label: 'Vigencia RETIE',
              //       color: data.vigenciaretieColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones: segOdas.map((e) => e.vigenciaretie).toList(),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // SizedRow(
              //   children: [
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechatcacontractual,
              //       campo: CampoSegOda.fechatcacontractual,
              //       label: 'Fecha TCA Contractual',
              //       color: data.fechatcacontractualColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechaestimadatcacierremlm,
              //       campo: CampoSegOda.fechaestimadatcacierremlm,
              //       label: 'Fecha Estimada TCA (Cierre MLM)',
              //       color: data.fechaestimadatcacierremlmColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.hitotcacumplido,
              //       campo: CampoSegOda.hitotcacumplido,
              //       label: 'Hito TCA Cumplido',
              //       color: data.hitotcacumplidoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // SizedRow(
              //   children: [
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.plandeproduccion,
              //       campo: CampoSegOda.plandeproduccion,
              //       label: 'Plan de Producción',
              //       color: data.plandeproduccionColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones: segOdas.map((e) => e.plandeproduccion).toList(),
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.fechapruebasqmlm,
              //       campo: CampoSegOda.fechapruebasqmlm,
              //       label: 'Fecha Pruebas Q MLM',
              //       color: data.fechapruebasqmlmColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.fecha,
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.hitopruebasqcumplido,
              //       campo: CampoSegOda.hitopruebasqcumplido,
              //       label: 'Hito Pruebas Q',
              //       color: data.hitopruebasqcumplidoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones:
              //           segOdas.map((e) => e.hitopruebasqcumplido).toList(),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // SizedRow(
              //   children: [
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.rollingtenderdeclarado,
              //       campo: CampoSegOda.rollingtenderdeclarado,
              //       label: 'Rolling Tender Declarado',
              //       color: data.rollingtenderdeclaradoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones:
              //           segOdas.map((e) => e.rollingtenderdeclarado).toList(),
              //     ),
              //     const SizedBox(width: 10),
              //     FieldPre(
              //       flex: 2,
              //       initialValue: data.rollingtenderno,
              //       campo: CampoSegOda.rollingtenderno,
              //       label: 'Rolling Tender No',
              //       color: data.rollingtendernoColor,
              //       edit: editAllFields,
              //       tipoCampo: TipoCampo.texto,
              //       opciones: segOdas.map((e) => e.rollingtenderno).toList(),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              SizedRow(
                children: [
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.tiempoestimadodetransporte,
                  //   campo: CampoSegOda.tiempoestimadodetransporte,
                  //   label: 'Tiempo estimado transporte',
                  //   color: data.tiempoestimadodetransporteColor,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.texto,
                  //   opciones: segOdas
                  //       .map((e) => e.tiempoestimadodetransporte)
                  //       .toList(),
                  // ),
                  // const SizedBox(width: 10),
                  FieldPre(
                    flex: 2,
                    initialValue: data.fechaentregaincotermactualizada,
                    campo: CampoSegOda.fechaentregaincotermactualizada,
                    label: 'Fecha Entrega incoterm Actualizada',
                    color: data.fechaentregaincotermactualizadaColor,
                    edit: editAllFields,
                    tipoCampo: TipoCampo.fecha,
                  ),
                  const SizedBox(width: 10),
                  // FieldPre(
                  //   flex: 2,
                  //   initialValue: data.hitocumplido,
                  //   campo: CampoSegOda.hitocumplido,
                  //   label: 'Hito Entrega Cumplido',
                  //   color: data.hitocumplidoColor,
                  //   edit: editAllFields,
                  //   tipoCampo: TipoCampo.texto,
                  // ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

class TituloSecc extends StatelessWidget {
  final String titulo;
  const TituloSecc(
    this.titulo, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}

class CardEstado2 extends StatelessWidget {
  final Color background;
  final List<Widget> children;
  const CardEstado2({
    required this.background,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class CardEstado extends StatelessWidget {
  final Color background;
  final List<Widget> children;
  const CardEstado({
    required this.background,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: background,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
