import 'package:com/resources/field_pre_texto.dart';
import 'package:com/resources/to_celda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../version.dart';
import '../model/resumengestor_model.dart';

class ResumenGestorPage extends StatefulWidget {
  const ResumenGestorPage({super.key});

  @override
  State<ResumenGestorPage> createState() => _ResumenGestorPageState();
}

class _ResumenGestorPageState extends State<ResumenGestorPage> {
  String gestor = '';
  String proveedor = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        ResumenGestor resumenGestor = state.resumenGestor!;
        List<String> proveedores = resumenGestor.resumenGestorList
            .where((e) => e.total > 0)
            .where((e) => e.gestor.toLowerCase().contains(gestor.toLowerCase()))
            .map((e) => e.proveedorCorregido)
            .toList();
        proveedores.sort();
        List<String> gestores = resumenGestor.resumenGestorList
            .where((e) => e.total > 0)
            .map((e) => e.gestor.toUpperCase())
            .toList();
        gestores.sort();
        List<ResumenGestorSingle> resumenList = resumenGestor.resumenGestorList
            .where((e) => e.total > 0)
            .where((e) =>
                e.proveedor.toLowerCase().contains(proveedor.toLowerCase()))
            .where((e) => e.gestor.toLowerCase().contains(gestor.toLowerCase()))
            .toList();
        resumenList.sort(((a, b) => a.gestor.compareTo(b.gestor)));
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
            title: const Text('RESUMEN GESTOR (Millones de pesos)'),
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
              ElevatedButton(
                onPressed: () {
                  DescargaHojas().ahoraMap(
                    datos: resumenList.map((e) => e.toMap()).toList(),
                    nombre: 'Resumen Gestor',
                  );
                },
                child: const Text('Download'),
              ),
              const Gap(10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    FieldTexto(
                        flex: 1,
                        edit: true,
                        label: 'Proveedor',
                        initialValue: proveedor,
                        opciones: proveedores,
                        asignarValor: (value) {
                          setState(() {
                            proveedor = value;
                          });
                        }),
                    const Gap(10),
                    FieldTexto(
                        flex: 1,
                        edit: true,
                        label: 'Gestores',
                        initialValue: gestor,
                        opciones: gestores,
                        asignarValor: (value) {
                          setState(() {
                            gestor = value;
                          });
                        }),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    for (ToCelda celda in resumenGestor.titles)
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
                const Gap(10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //SearchField
                        const SizedBox(height: 4),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: resumenList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  for (ToCelda celda
                                      in resumenList[index].celdas)
                                    Expanded(
                                      flex: celda.flex,
                                      child: Text(
                                        celda.valor,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: celda.colorFuente,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
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
