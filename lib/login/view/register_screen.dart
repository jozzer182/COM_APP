import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../bloc/main_bloc.dart';
import '../model/auth_services.dart';
import '../model/login_model.dart';

// import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telController = TextEditingController();
  String? selectedItemPerfil = 'funcional';

  AuthService authService = AuthService();
  bool loading = false;
  String? errorMail;
  String? passwordError;

  // Método para validar la contraseña
  String? validatePassword(String password) {
    if (password.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres.';
    }
    if (password.length > 100) {
      return 'La contraseña no puede exceder los 100 caracteres.';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Debe contener al menos una letra mayúscula.';
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Debe contener al menos una letra minúscula.';
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Debe contener al menos un número.';
    }
    if (!RegExp(r'[$@!%*#?&]').hasMatch(password)) {
      return 'Debe contener al menos un carácter especial (\$ @ ! % * # ? &).';
    }
    if (password.contains(' ')) {
      return 'No se permite el uso de espacios.';
    }
    return null; // Contraseña válida
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Enel'),
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: columnData(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> columnData() {
    return [
      const Text(
        'Favor indique su correo corporativo "@enel.com" y una contraseña para acceder al aplicativo, no se sincronizará con la contraseña de red.',
        maxLines: 5,
        textAlign: TextAlign.center,
      ),
      const Gap(4),
      const Text(
        // "Reglas para las contraseñas:\nLongitud mínima 8 caracteres\nLongitud máxima 100 caracteres\nAl menos, un carácter alfabético en mayúsculas\nAl menos, un carácter alfabético en minúsculas",
        "Reglas para las contraseñas:\nLongitud mínima 8 caracteres\nLongitud máxima 100 caracteres\nAl menos, un carácter alfabético en mayúsculas\nAl menos, un carácter alfabético en minúsculas\nAl menos, un carácter numérico\nAl menos, un carácter especial (\$ @ ! % * # ? &)\nEl carácter especial espacio ( ) no se puede utilizar",
        // maxLines: 5,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey
        ),
      ),
      const SizedBox(height: 30.0),
      TextField(
        controller: nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'Nombre - Apellido',
          border: OutlineInputBorder(),
          errorMaxLines: 2,
        ),
      ),
      const SizedBox(height: 30.0),
      TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          labelText: 'Correo',
          border: const OutlineInputBorder(),
          errorText: authService.errorCall ?? errorMail,
          errorMaxLines: 2,
        ),
      ),
      const SizedBox(height: 30.0),
      TextFormField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        controller: passwordController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Contraseña',
          border: const OutlineInputBorder(),
          errorText: passwordError,
          errorMaxLines: 2,
        ),
        onChanged: (value) {
          setState(() {
            passwordError = validatePassword(value);
          });
        },
      ),
      const SizedBox(height: 30.0),
      Builder(
        builder: (context) {
          if (loading) {
            return const CircularProgressIndicator();
          } else {
            return ElevatedButton(
              child: const Text('Registrarse'),
              onPressed: validatePassword(passwordController.text) != null
                  ? null
                  : () async {
                      final passwordValidation =
                          validatePassword(passwordController.text);
                      if (passwordValidation != null) {
                        setState(() {
                          passwordError = passwordValidation;
                        });
                        return; // No continuar si la contraseña no es válida
                      }
                      login.registrarse(
                        context: context,
                        emailController: emailController,
                        passwordController: passwordController,
                        nameController: nameController,
                        // telController: telController,
                        selectedItemPerfil: selectedItemPerfil,
                      );
                    },
            );
          }
        },
      ),
    ];
  }
}
