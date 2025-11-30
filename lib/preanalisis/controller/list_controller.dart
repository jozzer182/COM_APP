import 'package:com/fem/model/list_model.dart';
import 'package:com/fem/model/reg_model.dart';
import 'package:com/listado_contratos/model/listadocontrato.dart';
import 'package:com/preanalisis/model/list_cupocontrato_mode.dart';
import 'package:com/preanalisis/model/list_model.dart';
import 'package:com/preanalisis/model/reg_model.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../listado_contratos/model/listadocontrato_fila.dart';
import '../../listado_odas/model/listadoodas_model.dart';
import '../../listado_posiciones/model/listadoposiciones_fila.dart';
import '../../listado_posiciones/model/listadoposiciones_model.dart';
import '../../oe/model/oe_model.dart';
import '../../plataforma/model/plataforma_model.dart';
import '../../versiones/model/versiones_model.dart';
import '../model/list_proyecto.dart';
import '../model/reg_cupocontrato_model.dart';
import '../model/reg_proyecto.dart';

class PreanalisisListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;
  late Plataforma plataforma;
  late Oe oe;
  late FemList fem;
  late Versiones versiones;
  late ListadoContratos listadoContratos;
  late ListadoPosiciones listadoPosiciones;
  late ListadoOdas listadoOdas;

  PreanalisisListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
    plataforma = state().plataforma!;
    oe = state().oe!;
    fem = state().femList!;
    versiones = state().versiones!;
    listadoContratos = state().listadoContratos!;
    listadoPosiciones = state().listadoPosiciones!;
    listadoOdas = state().listadoOdas!;
  }

  get crear async {
    PreanalisisList preanalisisList = PreanalisisList();
    // PreanalisisListProy preanalisisListProy = PreanalisisListProy();
    Map plataformaByE4e = plataforma.plataformaByE4e;
    List<String> e4eList = _obtenerE4e();
    CupocontratoList cupocontratoList = preanalisisList.cupocontratoList;

    for (String e4e in e4eList) {
      _obtenerCupoyContrato(cupocontratoList, e4e);
      num cupo = 0;
      String contratos = '';
      // num valorunitario = 0;
      if (cupocontratoList.list.where((e) => e.e4e == e4e).isNotEmpty) {
        cupo = cupocontratoList.list
            .where((e) => e.e4e == e4e)
            .map((e) => e.cupo)
            .reduce((value, element) => value + element);
        cupo = num.parse(cupo.toStringAsFixed(1));
        contratos = cupocontratoList.list
            .where((e) => e.e4e == e4e)
            .map((e) => e.contrato)
            .join(', ');
        // valorunitario = cupocontratoList.list
        //     .firstWhere((e) => e.e4e == e4e)
      }
      preanalisisList.list.add(
        PreanalisisReg(
          e4e: e4e,
          descripcion: 'descripcion',
          plataforma:
              plataformaByE4e[e4e] != null ? plataformaByE4e[e4e]['ctd'] : 0,
          oe: oe.ctdAno(e4e),
          fem: fem.ctdAno(e4e),
          otros: versiones.ctdAno(e4e),
          cupo: cupo,
          contratos: contratos,
        ),
      );
    }
    preanalisisList.list =
        preanalisisList.list.where((e) => e.fem > 0).toList();
    preanalisisList.list.sort((a, b) => a.e4e.compareTo(b.e4e));
    for (PreanalisisReg preanalisisList in preanalisisList.list) {
      preanalisisList.descripcion =
          fem.list.firstWhere((e) => e.e4e == preanalisisList.e4e).descripcion;
    }
    // print('preanalisisList.list.length: ${preanalisisList.list.length}');
    // print(
    //     'preanalisisList.cupocontratoList.list: ${preanalisisList.cupocontratoList.list}');
    emit(state().copyWith(preanalisisList: preanalisisList));
  }

  void crearProyecto(String e4e) async {
    PreanalisisList preanalisisList = state().preanalisisList!;
    PreanalisisProyectoList proyectoList = preanalisisList.proyectoList;
    proyectoList.list.clear();
    List<String> proyectos = fem.list
        .where((e) => e.e4e == e4e)
        .map((e) => e.proyecto)
        .toSet()
        .toList();
    for (String proyecto in proyectos) {
      List<FemReg> femRegs = fem.list
          .where((e) => e.proyecto == proyecto && e.e4e == e4e && e.total > 0)
          .toList();
      if (femRegs.isEmpty) continue;
      num ctd = femRegs.map((e) => e.ctdAno).reduce((a, b) => a + b);
      if (ctd == 0) continue;
      String femfecha = femRegs.map((e) => e.mesesCambios).join(', ');
      proyectoList.list.add(
        PreanalisisProyectoReg(
          proyecto: femRegs[0].proyecto,
          pm: femRegs[0].pm,
          portfolio: femRegs[0].unidad,
          e4e: femRegs[0].e4e,
          descripcion: femRegs[0].descripcion,
          um: femRegs[0].um,
          ctd: '$ctd',
          femid: femRegs[0].id,
          femctd: '$ctd',
          femfecha: femfecha,
          femobservacion:
              '${femRegs[0].comentario1} + ${femRegs[0].comentario2}',
          wbe: femRegs[0].wbe,
          proyectowbe: femRegs[0].proyectoWBE,
        ),
      );
    }
  }

  List<String> _obtenerE4e() {
    List<String> femE4eList = fem.list.map((e) => e.e4e).toSet().toList();
    return femE4eList;
  }

  void _obtenerCupoyContrato(
    CupocontratoList cupocontratoList,
    String e4e,
  ) {
    List<ListadoPosicionesFila> posiciones =
        listadoPosiciones.list.where((e) => e.e4e == e4e).toList();
    if (posiciones.isEmpty) return;

    List<String> contratos = posiciones.map((e) => e.contrato).toSet().toList();
    for (String contrato in contratos) {
      ListadoContratosFila contratoFila = listadoContratos.list.firstWhere(
          (e) => e.contrato == contrato,
          orElse: () => ListadoContratosFila.zero());
      num valorunitario = posiciones
          .firstWhere(
            (e) => e.contrato == contrato && e.e4e == e4e,
            orElse: () => ListadoPosicionesFila.zero(),
          )
          .precioneto;
      num porcentajeresante = 0;
      num cupo = 0;
      if (contratoFila.valorprevisto > 0) {
        porcentajeresante = num.parse(
            ((contratoFila.valorrestante / contratoFila.valorprevisto) * 100)
                .toStringAsFixed(1));
      }
      if (valorunitario > 0) {
        cupo = num.parse(
            (contratoFila.valorrestante / valorunitario).toStringAsFixed(1));
      }
      cupocontratoList.list.add(
        CupoContrato(
          contrato: contrato,
          objeto: contratoFila.sintetico,
          e4e: e4e,
          cupo: cupo,
          fin: contratoFila.fin,
          valorrestante: contratoFila.valorrestante,
          porcentajerestante: porcentajeresante,
          valorunitario: valorunitario,
          moneda: contratoFila.moneda,
        ),
      );
    }
  }
}
