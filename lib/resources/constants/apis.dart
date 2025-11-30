import '../env_config.dart';

class Api {
  static String get enviarSolpe => EnvConfig.apiEnviarSolpe;

  static String get fem => EnvConfig.apiFem;

  static String get femSamSupUrl => EnvConfig.supabaseUrl;
  static String get femSamSupKey => EnvConfig.supabaseAnonKey;

  static String get femSamSupUrlNew => EnvConfig.supabaseUrlNew;
  static String get femSamSupKeyNew => EnvConfig.supabaseAnonKeyNew;
}
