import 'package:cashflow/pages/home_page.dart';
import 'package:cashflow/pages/novo_jogo_page.dart';
import 'package:cashflow/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.deepPurple,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color.fromARGB(255, 76, 18, 129),
      ),
      routes: {
        AppRoutes.home: (ctx) => const HomePage(),
        AppRoutes.newGame: (ctx) => const NovoJogoPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
