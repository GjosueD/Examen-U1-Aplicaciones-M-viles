import 'package:flutter_test/flutter_test.dart';

import 'package:pr06_sueldo_horario/viewmodel/empleado_viewmodel.dart';

void main() {
  test('calcula la comisión según el rango de ventas', () {
    final viewModel = EmpleadoViewModel();

    expect(viewModel.obtenerPorcentajeComision(499.99), 0);
    expect(viewModel.obtenerPorcentajeComision(500), 0.05);
    expect(viewModel.obtenerPorcentajeComision(999.99), 0.05);
    expect(viewModel.obtenerPorcentajeComision(1000), 0.10);
    expect(viewModel.obtenerPorcentajeComision(1999.99), 0.10);
    expect(viewModel.obtenerPorcentajeComision(2000), 0.15);
  });

  test('calcula comisión y sueldo final', () {
    final resultado = EmpleadoViewModel().calcularSueldo(3000, 1200);

    expect(resultado.comision, 120);
    expect(resultado.sueldoFinal, 3120);
  });
}
