import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class SelectorGenero extends StatefulWidget {
  const SelectorGenero({super.key});

  @override
  State<SelectorGenero> createState() => _SelectorGeneroState();
}

class _SelectorGeneroState extends State<SelectorGenero> {
  String? generoSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Hombre
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                generoSeleccionado = "Hombre";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
                right: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: generoSeleccionado == "Hombre"
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      SizedBox(height: 8),
                      Text("Hombre".toUpperCase(), style: EstiloTexto.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Mujer
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                generoSeleccionado = "Mujer";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                bottom: 16,
                right: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: generoSeleccionado == "Mujer"
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100),
                      SizedBox(height: 8),
                      Text("Mujer".toUpperCase(), style: EstiloTexto.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
