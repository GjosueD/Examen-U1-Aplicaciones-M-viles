import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/principal_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';
import 'viewmodel/empleado_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EmpleadoViewModel(),
      child: const MiApp(),
    ),
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comisión de ventas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F6FB),
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const InicioPantalla(),
        '/principal': (_) => const PrincipalPantalla(),
        '/resultado': (_) => const ResultadoPantalla(),
      },
    );
  }
}
