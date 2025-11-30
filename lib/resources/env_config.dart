import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuration class to access environment variables
/// All sensitive credentials should be stored in .env file
class EnvConfig {
  // ========================================
  // Firebase Configuration - Web
  // ========================================
  static String get firebaseWebApiKey =>
      dotenv.env['FIREBASE_WEB_API_KEY'] ?? '';
  static String get firebaseWebAppId =>
      dotenv.env['FIREBASE_WEB_APP_ID'] ?? '';
  static String get firebaseWebMessagingSenderId =>
      dotenv.env['FIREBASE_WEB_MESSAGING_SENDER_ID'] ?? '';
  static String get firebaseWebProjectId =>
      dotenv.env['FIREBASE_WEB_PROJECT_ID'] ?? '';
  static String get firebaseWebAuthDomain =>
      dotenv.env['FIREBASE_WEB_AUTH_DOMAIN'] ?? '';
  static String get firebaseWebStorageBucket =>
      dotenv.env['FIREBASE_WEB_STORAGE_BUCKET'] ?? '';

  // ========================================
  // Firebase Configuration - Android
  // ========================================
  static String get firebaseAndroidApiKey =>
      dotenv.env['FIREBASE_ANDROID_API_KEY'] ?? '';
  static String get firebaseAndroidAppId =>
      dotenv.env['FIREBASE_ANDROID_APP_ID'] ?? '';
  static String get firebaseAndroidMessagingSenderId =>
      dotenv.env['FIREBASE_ANDROID_MESSAGING_SENDER_ID'] ?? '';
  static String get firebaseAndroidProjectId =>
      dotenv.env['FIREBASE_ANDROID_PROJECT_ID'] ?? '';
  static String get firebaseAndroidStorageBucket =>
      dotenv.env['FIREBASE_ANDROID_STORAGE_BUCKET'] ?? '';

  // ========================================
  // Google Apps Script URLs
  // ========================================
  static String get apiEnviarSolpe =>
      dotenv.env['API_ENVIAR_SOLPE'] ?? '';
  static String get apiFem =>
      dotenv.env['API_FEM'] ?? '';
  static String get apiCosti =>
      dotenv.env['API_COSTI'] ?? '';
  static String get apiHovip =>
      dotenv.env['API_HOVIP'] ?? '';
  static String get apiCom =>
      dotenv.env['API_COM'] ?? '';
  static String get apiUsdCop =>
      dotenv.env['API_USDCOP'] ?? '';
  static String get apiOeActions =>
      dotenv.env['API_OE_ACTIONS'] ?? '';
  static String get apiFileUploader =>
      dotenv.env['API_FILE_UPLOADER'] ?? '';
  static String get apiMail =>
      dotenv.env['API_MAIL'] ?? '';

  // ========================================
  // Supabase Configuration
  // ========================================
  static String get supabaseUrl =>
      dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey =>
      dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get supabaseUrlNew =>
      dotenv.env['SUPABASE_URL_NEW'] ?? '';
  static String get supabaseAnonKeyNew =>
      dotenv.env['SUPABASE_ANON_KEY_NEW'] ?? '';
}

