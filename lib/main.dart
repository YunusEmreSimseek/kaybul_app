import 'package:flutter/material.dart';
import 'package:kaybul_app/features/login/view/login_view.dart';
import 'package:kaybul_app/products/inits/application_initialize.dart';
import 'package:kaybul_app/products/inits/bloc_initialize.dart';
import 'package:kaybul_app/products/utilities/theme/project_general_theme.dart';

Future<void> main() async {
  await ApplicationInitialize.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocInitialize(
      child: MaterialApp(
        theme: ProjectGeneralTheme.dark(),
        home: const LoginView(),
      ),
    );
  }
}
