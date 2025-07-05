import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class SelectorAltura extends StatefulWidget {
  // En centímetros
  final double alturaSeleccionada;
  final Function(double) asignarAltura;

  const SelectorAltura({
    super.key,
    required this.alturaSeleccionada,
    required this.asignarAltura,
  });

  @override
  State<SelectorAltura> createState() => _SelecctorAlturaState();
}

class _SelecctorAlturaState extends State<SelectorAltura> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Altura".toUpperCase(), style: EstiloTexto.bodyText),
            ),
            // Para quitarle el decimal
            Text(
              "${widget.alturaSeleccionada.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.alturaSeleccionada,
              onChanged: (nuevaAltura) {
                widget.asignarAltura(nuevaAltura);
              },
              min: 140,
              max: 220,
              divisions: 80, // Número de saltos que queremos
              label: "${widget.alturaSeleccionada.toStringAsFixed(0)} cm",
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
