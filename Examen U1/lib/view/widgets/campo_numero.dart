import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoNumero extends StatelessWidget {
  final String etiqueta;
  final String? ayuda;
  final TextEditingController controller;

  const CampoNumero({
    super.key,
    required this.etiqueta,
    required this.controller,
    this.ayuda,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        labelText: etiqueta,
        hintText: ayuda,
        prefixText: '\$ ',
        border: const OutlineInputBorder(),
      ),
    );
  }
}
