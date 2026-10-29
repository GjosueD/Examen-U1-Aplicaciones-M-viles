import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/empleado_model.dart';
import '../../viewmodel/empleado_viewmodel.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  String dinero(double valor) => '\$${valor.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context)?.settings.arguments;
    final resultado = argumento is EmpleadoModel
        ? argumento
        : context.watch<EmpleadoViewModel>().resultado;

    if (resultado == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Resultados')),
        body: const Center(child: Text('No hay un cálculo disponible.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Resumen del cálculo',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  _Dato(titulo: 'Sueldo base', valor: dinero(resultado.sueldoBase)),
                  _Dato(titulo: 'Ventas del mes', valor: dinero(resultado.ventas)),
                  _Dato(
                    titulo: 'Porcentaje de comisión',
                    valor: '${(resultado.porcentajeComision * 100).toStringAsFixed(0)}%',
                  ),
                  _Dato(titulo: 'Comisión', valor: dinero(resultado.comision)),
                  const Divider(height: 1),
                  _Dato(
                    titulo: 'Sueldo final',
                    valor: dinero(resultado.sueldoFinal),
                    destacado: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/principal',
                (route) => false,
              ),
              child: const Text('Nuevo cálculo'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dato extends StatelessWidget {
  final String titulo;
  final String valor;
  final bool destacado;

  const _Dato({
    required this.titulo,
    required this.valor,
    this.destacado = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = destacado
        ? Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          )
        : null;

    return ListTile(
      title: Text(titulo, style: style),
      trailing: Text(valor, style: style),
    );
  }
}
