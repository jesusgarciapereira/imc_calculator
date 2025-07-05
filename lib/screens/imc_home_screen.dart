import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/hight_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int edadSeleccionada = 20;
  int pesoSeleccionado = 80;
  double alturaSeleccionada = 160;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectorGenero(),
        SelectorAltura(
          alturaSeleccionada: alturaSeleccionada,
          asignarAltura: (nuevaAltura) {
            setState(() {
              alturaSeleccionada = nuevaAltura;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: SelectorNumero(
                  titulo: "Peso",
                  valor: pesoSeleccionado,
                  incrementar: () {
                    setState(() {
                      pesoSeleccionado++;
                    });
                  },
                  decrementar: () {
                    setState(() {
                      pesoSeleccionado--;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SelectorNumero(
                  titulo: "Edad",
                  valor: edadSeleccionada,
                  incrementar: () {
                    setState(() {
                      edadSeleccionada++;
                    });
                  },
                  decrementar: () {
                    setState(() {
                      edadSeleccionada--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular", style: EstiloTexto.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
