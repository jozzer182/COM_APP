import 'package:com/budget/view/budget_page.dart';
import 'package:com/oe/view/oe_page.dart';

import 'package:com/segodas/view/segodas_page.dart';
import 'package:com/wbe/view/wbe_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../bloc/main_bloc.dart';
import '../contrato/view/contratos_page.dart';
import '../fem/view/list_page.dart';
import '../historico/view/historico_page.dart';
import '../listado_contratos/view/listadocontrato_page.dart';
import '../listado_odas/view/listadoodas_page.dart';
import '../listado_posiciones/view/listadoposiciones_page.dart';
import '../mail/view/mail_page.dart';
import '../plataforma/view/plataforma_page.dart';
import '../preanalisis/view/list_page.dart';
import '../preorden/view/list_page.dart';
import '../resources/transicion_pagina.dart';
import '../resumenanticipos/view/resumenanticipos_page.dart';
import '../resumengeneral/view/resumengeneral_page.dart';
import '../resumengestor/view/resumengestor_page.dart';
import '../resumenproveedor/view/resumenproveedor_page.dart';
import '../resumenproyecto/view/resumenproyecto_page.dart';
import '../version.dart';
import '../versiones/view/versiones_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double elevationCard1 = 1.0;
  double elevationCard2 = 1.0;
  double elevationCard3 = 1.0;
  double elevationCard4 = 1.0;
  double elevationCard5 = 1.0;
  @override
  Widget build(BuildContext context) {
    // Color primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    // Color onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;
    // Color tertiaryContainer = Theme.of(context).colorScheme.tertiaryContainer;
    // Color onTertiaryContainer =
    //     Theme.of(context).colorScheme.onTertiaryContainer;
    // Color secondaryContainer = Theme.of(context).colorScheme.secondaryContainer;
    // Color onSecondaryContainer =
    //     Theme.of(context).colorScheme.onSecondaryContainer;
    // Color background = Theme.of(context).colorScheme.background;
    // Color onBackground = Theme.of(context).colorScheme.onBackground;
    Color primary = Theme.of(context).colorScheme.primary;
    Color tertiary = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "",
                style: TextStyle(
                  color: tertiary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: "COM",
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: BlocSelector<MainBloc, MainState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, state) {
              // print('called');
              return state ? const LinearProgressIndicator() : const SizedBox();
            },
          ),
        ),
        actions: [
          // ElevatedButton(
          //   onPressed: () {
          //     BlocProvider.of<MainBloc>(context).usuarios;
          //   },
          //   child: const Text('Prueba'),
          // ),
          Tooltip(
            message: 'Recargar datos',
            child: IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(Load());
              },
              icon: const Icon(Icons.refresh),
            ),
          ),
          const SizedBox(width: 8),
          Tooltip(
            message: 'Cambiar color',
            child: IconButton(
              onPressed: () {
                showDialog(
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Escoge un color'),
                      content: SingleChildScrollView(
                        child: MaterialColorPicker(
                          allowShades: false,
                          onMainColorChange: (ColorSwatch<dynamic>? value) {
                            if (value != null) {
                              BlocProvider.of<MainBloc>(context).add(
                                ThemeColorChange(color: Color(value.value)),
                              );
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    );
                  },
                  context: context,
                );
              },
              icon: const Icon(Icons.color_lens),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Cambiar tema',
            child: IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(ThemeChange());
              },
              icon: const Icon(Icons.brightness_4_outlined),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Cerrar sesión',
            child: IconButton(
              icon: Icon(
                Icons.logout,
                color: primary,
                size: 16,
              ),
              onPressed: () async => await FirebaseAuth.instance.signOut(),
            ),
          )
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Version.data,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              Version.status('Home', '$runtimeType'),
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: SingleChildScrollView(
        child: BlocListener<MainBloc, MainState>(
          listenWhen: (previous, current) =>
              previous.errorCounter != current.errorCounter,
          listener: (context, state) {
            // ignore: avoid_print
            print(state.message);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 8),
                backgroundColor: state.messageColor,
                content: Text(state.message),
              ),
            );
          },
          child: BlocListener<MainBloc, MainState>(
            listenWhen: (previous, current) =>
                previous.dialogCounter != current.dialogCounter,
            listener: (context, state) {
              // ignore: avoid_print
              print(state.dialogMessage);
              if (state.dialogMessage.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text('Atención'),
                      content: Text(state.dialogMessage),
                      actions: [
                        ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Gap(5),
                          Text('1 Dólar: ${state.usdcop?.close} pesos'),
                          const Gap(10),
                          Text('1 Euro: ${state.eurcop?.close} pesos'),
                        ],
                      ),
                      const Text('Seguimiento Odas'),
                      const Gap(10),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        children: [
                          SimpleCard(
                            page: const OePage(),
                            title: 'Órdenes\nDatos SAP',
                            image: 'images/order.png',
                            enabled: state.oe != null,
                          ),
                          SimpleCard(
                            page: const SegOdasPage(),
                            title: 'Seguimiento\nOdas',
                            image: 'images/global.png',
                            enabled: state.segOdas != null,
                          ),

                          // SimpleCard(
                          //   page: const MlmPage(),
                          //   title: 'MLM',
                          //   image: 'images/test.png',
                          //   enabled: state.mlm != null,
                          // ),
                          SimpleCard(
                            page: const ContratoPage(),
                            title: 'Información\nContratual',
                            image: 'images/calendar.png',
                            enabled: state.contrato != null,
                          ),
                          SimpleCard(
                            page: const MailPage(),
                            title: 'Enviar\nMail',
                            image: 'images/mail.png',
                            enabled: state.resumenGeneral != null,
                          ),

                          // SimpleCard(
                          //   page: const SapmlmsPage(),
                          //   title: 'Información\nSAP - MLM',
                          //   image: 'images/link.png',
                          //   enabled: state.sapmlms != null,
                          // ),
                          const SimpleCard(
                            page: HistoricoPage(),
                            title: 'Histórico',
                            image: 'images/data.png',
                            enabled: true,
                          ),
                        ],
                      ),
                      const Gap(10),
                      const Text('Resumenes Segimiento Odas'),
                      const Gap(10),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        children: [
                          SimpleCard(
                            page: const ResumenProveedorPage(),
                            title: 'Resumen\nProveedor',
                            image: 'images/data.png',
                            enabled: state.resumenProveedor != null,
                          ),
                          SimpleCard(
                            page: const ResumenProyectoPage(),
                            title: 'Resumen\nProyecto',
                            image: 'images/analysis1.png',
                            enabled: state.resumenProyecto != null,
                          ),
                          SimpleCard(
                            page: const ResumenGeneralPage(),
                            title: 'Resumen\nProyecto - Proveedor',
                            image: 'images/analysis2.png',
                            enabled: state.resumenGeneral != null,
                          ),
                          SimpleCard(
                            page: const ResumenAnticiposPage(),
                            title: 'Resumen\nAnticipos',
                            image: 'images/contract.png',
                            enabled: state.resumenAnticipos != null,
                          ),
                          SimpleCard(
                            page: const ResumenGestorPage(),
                            title: 'Resumen\nGestor - Proveedor',
                            image: 'images/test.png',
                            enabled: state.resumenGestor != null,
                          ),
                        ],
                      ),
                      const Gap(10),
                      const Text('SAP'),
                      const Gap(10),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        children: [
                          SimpleCard(
                            page: const ListadoContratosPage(),
                            title: 'Listado\nContratos',
                            image: 'images/listado_contratos.png',
                            enabled: state.listadoContratos != null,
                          ),
                          SimpleCard(
                            page: const ListadoPosicionesPage(),
                            title: 'Listado\nPosiciones',
                            image: 'images/listado_posiciones.png',
                            enabled: state.listadoPosiciones != null,
                          ),
                          SimpleCard(
                            page: const ListadoOdasPage(),
                            title: 'Listado\nOdas',
                            image: 'images/listado_odas.png',
                            enabled: state.listadoOdas != null,
                          ),
                          SimpleCard(
                            page: const PlataformaPage(),
                            title: 'Plataforma',
                            image: 'images/warehouse.png',
                            enabled: state.plataforma != null,
                          ),
                          SimpleCard(
                            page: const BudgetPage(),
                            title: 'Budget',
                            image: 'images/salary.png',
                            enabled: state.budget != null,
                          ),
                          SimpleCard(
                            page: const WbePage(),
                            title: 'WBE',
                            image: 'images/diagram.png',
                            enabled: state.wbe != null,
                          ),
                        ],
                      ),
                      const Gap(10),
                      const Text('PRE ÓRDENES'),
                      const Gap(10),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        children: [
                          SimpleCard(
                            page: const FemListPage(),
                            title: 'Fichas',
                            image: 'images/gantt-chart.png',
                            enabled: state.femList != null,
                          ),
                          SimpleCard(
                            page: const VersionOficialPage(),
                            title: 'Otros',
                            image: 'images/version.png',
                            enabled: state.versiones != null,
                          ),
                          SimpleCard(
                            page: const PreanalisisListPage(),
                            title: 'Pre Análisis',
                            image: 'images/data2.png',
                            enabled: state.preanalisisList != null,
                          ),
                          SimpleCard(
                            page: const PreordenListpage(),
                            title: 'PreOrdenes',
                            image: 'images/preorden.png',
                            enabled: state.preordenList != null,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleCard extends StatelessWidget {
  final dynamic page;
  final String title;
  final String image;
  final Function? fun;
  final Color? color;
  final bool enabled;
  final bool esPermitido;

  const SimpleCard({
    required this.page,
    required this.title,
    required this.image,
    required this.enabled,
    this.esPermitido = true,
    this.color,
    this.fun,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return Opacity(
      opacity: enabled ? 1 : 0.1,
      child: SizedBox(
        width: 148.0,
        child: Card(
          color: color,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              if (page is Widget) {
                try {
                  goTo(page);
                } finally {
                  if (fun != null) fun!();
                }
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 12,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
