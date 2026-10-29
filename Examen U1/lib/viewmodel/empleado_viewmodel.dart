import 'package:flutter/foundation.dart';

import '../models/empleado_model.dart';

class EmpleadoViewModel extends ChangeNotifier {
  EmpleadoModel? _resultado;

  EmpleadoModel? get resultado => _resultado;

  double obtenerPorcentajeComision(double ventas) {
    if (ventas < 500) {
      return 0;
    }
    if (ventas < 1000) {
      return 0.05;
    }
    if (ventas < 2000) {
      return 0.10;
    }
    return 0.15;
  }

  EmpleadoModel calcularSueldo(double sueldoBase, double ventas) {
    final porcentaje = obtenerPorcentajeComision(ventas);
    final comision = ventas * porcentaje;

    _resultado = EmpleadoModel(
      sueldoBase: sueldoBase,
      ventas: ventas,
      porcentajeComision: porcentaje,
      comision: comision,
      sueldoFinal: sueldoBase + comision,
    );
    notifyListeners();
    return _resultado!;
  }
}
