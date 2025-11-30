import 'package:com/listener_messages_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:localstorage/localstorage.dart';
import '../bloc/main_bloc.dart';
import '../firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home/home_page.dart';
import 'login/view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Load environment variables first
    await dotenv.load(fileName: ".env");
    
    await initLocalStorage();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    // ignore: avoid_print
    print(e);
    // ignore: avoid_print
    print('Error al inicializar Firebase');
    // ignore: avoid_print
    print(e.runtimeType);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()..add(Load()),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          // print('Color: ${state.themeColor}');
          return MaterialApp(
            title: 'COM',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorSchemeSeed:
                  state.themeColor ?? const Color.fromARGB(255, 17, 0, 255),
              useMaterial3: true,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              colorSchemeSeed:
                  state.themeColor ?? const Color.fromARGB(255, 0, 68, 255),
              useMaterial3: true,
              brightness: Brightness.dark,
            ),
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            // supportedLocales: const [Locale('en'), Locale('es')],
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            home: ListenerCustom(
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      (snapshot.data?.emailVerified ?? false)) {
                    return const HomePage();
                  }
                  return const LoginPage();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
