import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/empleado_viewmodel.dart';
import '../widgets/campo_numero.dart';

class PrincipalPantalla extends StatefulWidget {
  const PrincipalPantalla({super.key});

  @override
  State<PrincipalPantalla> createState() => _PrincipalPantallaState();
}

class _PrincipalPantallaState extends State<PrincipalPantalla> {
  final sueldoController = TextEditingController();
  final ventasController = TextEditingController();

  @override
  void dispose() {
    sueldoController.dispose();
    ventasController.dispose();
    super.dispose();
  }

  void calcular() {
    final sueldoBase = double.tryParse(sueldoController.text.trim());
    final ventas = double.tryParse(ventasController.text.trim());

    if (sueldoBase == null || ventas == null || sueldoBase < 0 || ventas < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa valores numéricos iguales o mayores que cero.'),
        ),
      );
      return;
    }

    final resultado = context
        .read<EmpleadoViewModel>()
        .calcularSueldo(sueldoBase, ventas);

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: resultado,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Datos del empleado')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingresa los datos del mes',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'La comisión se calculará según el total de ventas realizadas.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            CampoNumero(
              etiqueta: 'Sueldo base',
              ayuda: 'Ejemplo: 3500',
              controller: sueldoController,
            ),
            const SizedBox(height: 16),
            CampoNumero(
              etiqueta: 'Ventas del mes',
              ayuda: 'Ejemplo: 1250',
              controller: ventasController,
            ),
            const SizedBox(height: 24),
            Card(
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Comisiones: menos de \$500 = 0%, de \$500 a \$999 = 5%, '
                  'de \$1000 a \$1999 = 10% y \$2000 o más = 15%.',
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular comisión'),
            ),
          ],
        ),
      ),
    );
  }
}
