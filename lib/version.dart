import 'package:firebase_auth/firebase_auth.dart';

class Version {
  static String data = "Versión 13.5 Fix on OE";
  static String status(String page, String clase) {
    clase = clase.substring(clase.indexOf(":") + 1, clase.length);
    return "Conectado como: ${FirebaseAuth.instance.currentUser?.email ?? "Error"}, Fecha y hora: ${DateTime.now().toString().substring(0, 16)}, Página actual: $page($clase)";
  }
}

//initialization
Version version = Version();
