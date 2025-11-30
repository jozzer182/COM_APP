import 'dart:convert';

import 'package:http/http.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/apis.dart';
import '../../resources/future_group_add.dart';
import '../model/doc_model.dart';
import '../model/list_model.dart';
import '../model/reg_model.dart';

class FemListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  FemListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    FemList femList = FemList();
    FutureGroupDelayed futureGroupFEM = FutureGroupDelayed();
    int esteAno = DateTime.now().year;
    int proxAno = esteAno + 1;
    List years = [esteAno, proxAno];
    for (int year in years) {
      futureGroupFEM.addF(_llamarFicha(year: year, femList: femList));
    }
    futureGroupFEM.close();
    await futureGroupFEM.future;
    try {
      emit(state().copyWith(femList: femList));
    } catch (e) {
      bl.errorCarga("FEM", e);
    }
  }

  Future _llamarFicha({required int year, required FemList femList}) async {

    try {
      SupabaseClient supabaseClient = SupabaseClient(
        Api.femSamSupUrlNew,
        Api.femSamSupKeyNew,
      );
      PostgrestList dataAsListMap = [];
      bool error = true;

      try {
        dataAsListMap =
            await supabaseClient
                .from('f$year') // Tabla para sustitutos
                .select();
        error = false;
      } catch (e) {
        bl.errorCarga("Obtener Ficha $year 1ER intento", e);
        try {
          await Future.delayed(const Duration(seconds: 2));
          dataAsListMap =
              await supabaseClient
                  .from('f$year') // Tabla para sustitutos
                  .select();
          error = false;
        } catch (e) {
          bl.errorCarga("Obtener Ficha $year 2DO intento", e);
          try {
            await Future.delayed(const Duration(seconds: 5));
            dataAsListMap =
                await supabaseClient
                    .from('f$year') // Tabla para sustitutos
                    .select();
            error = false;
          } catch (e) {
            bl.errorCarga("Obtener Ficha $year 3ER intento", e);
            await Future.delayed(const Duration(seconds: 7));
            dataAsListMap =
                await supabaseClient
                    .from('f$year') // Tabla para sustitutos
                    .select();
            error = false;
          }
        }
      }
      if (dataAsListMap.length > 0) {
        for (PostgrestMap item in dataAsListMap) {
          femList.list.add(FemReg.fromMap(item));
          List<FemDoc> listDoc =
              femList.listDoc.where((e) => e.year == year).toList();
          if (listDoc.isEmpty) {
            femList.listDoc.add(FemDoc()..year = year);
          }
          femList.listDoc
              .where((e) => e.year == year)
              .first
              .list
              .add(FemReg.fromMap(item));
        }
      }
    } catch (e) {
      bl.errorCarga('FEM ficha del $year', e);
    }
  }
}
