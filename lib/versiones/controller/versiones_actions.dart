
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/apis.dart';
import '../../resources/future_group_add.dart';
import '../model/versiones_model.dart';
import '../model/versiones_model_sumsingle.dart';

// onLoadVersiones(Bl bl) async {
//   var emit = bl.emit;
//   MainState Function() state = bl.state;
//   Versiones versiones = Versiones();
//   List<String> versionesL = [
//     "2023",
//     "2024",
//     "2025",
//     "2026",
//     "2027",
//     "2028",
//   ];
//   FutureGroupDelayed futureGroupVersion = FutureGroupDelayed();
//   for (String version in versionesL) {
//     futureGroupVersion.addF(obtenerVersion(version, versiones, bl));
//   }
//   futureGroupVersion.close();
//   try {
//     await futureGroupVersion.future;
//     emit(state().copyWith(versiones: versiones));
//   } catch (e) {
//     bl.errorCarga("Versiones", e);
//   }
// }

// Future obtenerVersion(
//   String version,
//   Versiones versiones,
//   Bl bl,
// ) async {
//   try {
//     await versiones.obtener(version);
//   } catch (e) {
//     bl.errorCarga('versión: $version', e);
//   }
// }


class VersionesCtrl {
  final Bl bl;
  late MainState Function() state;
  late void Function(MainEvent p1) add;
  late var emit;

  VersionesCtrl(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    Versiones versiones = Versiones();
    List<String> versionesL = ["2025", "2026", "2027", "2028"];
    FutureGroupDelayed futureGroupVersion = FutureGroupDelayed();
    for (String version in versionesL) {
      futureGroupVersion.addF(obtenerRequest(version, versiones));
    }
    futureGroupVersion.close();
    try {
      await futureGroupVersion.future;
      emit(state().copyWith(versiones: versiones));
    } catch (e) {
      bl.errorCarga("Versiones", e);
    }
  }

  Future obtenerRequest(String version, Versiones versiones) async {
    final supabaseClient = SupabaseClient(
      Api.femSamSupUrlNew,
      Api.femSamSupKeyNew,
    );
    final dataAsListMap =
        await supabaseClient
            .from('v$version')
            .select();

    List<VersionByE4e> versionAno = versiones.version2025;
    List<VersionReg> vAno = versiones.v2025;
    if (version == '2025') {
      versiones.version2025 = [];
      versiones.version2025.clear();
      versionAno = versiones.version2025;
      vAno = versiones.v2025;
    }
    if (version == '2026') {
      versiones.version2026 = [];
      versiones.version2026.clear();
      versionAno = versiones.version2026;
      vAno = versiones.v2026;
    }
    if (version == '2027') {
      versiones.version2027 = [];
      versiones.version2027.clear();
      versionAno = versiones.version2027;
      vAno = versiones.v2027;
    }
    if (version == '2028') {
      versiones.version2028 = [];
      versiones.version2028.clear();
      versionAno = versiones.version2028;
      vAno = versiones.v2028;
    }

    if (dataAsListMap.length > 1) {
      for (var item in dataAsListMap) {
        VersionReg versionReg = VersionReg.fromMap(item);
        vAno.add(versionReg);
        if (!versionReg.unidad.toString().startsWith('PM')) {
          if (versionAno
              .where(
                (e) =>
                    e.e4e.toLowerCase() == versionReg.e4e.toString().toLowerCase() &&
                    e.unidad.toLowerCase() == versionReg.unidad.toString().toLowerCase(),
              )
              .isEmpty) {
            versionAno.add(
              VersionByE4e.fromInit(versionReg.e4e.toString(), versionReg.unidad.toString()),
            );
          }
          VersionByE4e versionByE4e = versionAno.firstWhere(
            (e) =>
                e.e4e.toLowerCase() == versionReg.e4e.toString().toLowerCase() &&
                e.unidad.toLowerCase() == versionReg.unidad.toString().toLowerCase(),
            orElse: () => VersionByE4e.zero(),
          );
          versionByE4e.addVersion(versionReg);
        }
      }
    }
  }
}

