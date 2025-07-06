import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';

class ImcResultScreen extends StatelessWidget {
  final int edadRecibida;
  final int pesoRecibido;
  final double alturaRecibida;

  const ImcResultScreen({
    super.key,
    required this.edadRecibida,
    required this.pesoRecibido,
    required this.alturaRecibida,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double alturaRecibidaMetros = alturaRecibida / 100;
    double resultadoIMC =
        pesoRecibido / (alturaRecibidaMetros * alturaRecibidaMetros);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu resultado", style: EstiloTexto.titleText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textoTituloIMC(resultadoIMC),
                    Column(
                      children: [
                        Text(
                          "IMC: ${resultadoIMC.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 68,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Edad: ${edadRecibida.toString()} años",
                          style: EstiloTexto.bodyText,
                        ),
                        Text(
                          "Peso: ${pesoRecibido.toString()} Kg",
                          style: EstiloTexto.bodyText,
                        ),
                        Text(
                          "Altura: ${alturaRecibidaMetros.toStringAsFixed(2)} m",
                          style: EstiloTexto.bodyText,
                        ),
                      ],
                    ),
                    textoDescripcionIMC(resultadoIMC),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: EstiloBoton.botonPrincipal,
              child: Text("Finalizar", style: EstiloTexto.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Text textoTituloIMC(double imc) {
    String titulo;
    Color colorTitulo;
    if (imc < 18.5) {
      titulo = "Bajo peso";
      colorTitulo = Color(0xFF1d91d0);
    } else if (imc < 25) {
      titulo = "Peso normal";
      colorTitulo = Color(0xFF5ab5e8);
    } else if (imc < 30) {
      titulo = "Sobrepeso";
      colorTitulo = Color(0xFF2fa148);
    } else if (imc < 35) {
      titulo = "Obesidad I";
      colorTitulo = Color(0xFFf4cc35);
    } else if (imc < 40) {
      titulo = "Obesidad II";
      colorTitulo = Color(0xFFf7a716);
    } else {
      titulo = "Obesidad III";
      colorTitulo = Color(0xFFd4222b);
    }

    return Text(
      titulo,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: colorTitulo,
      ),
      textAlign: TextAlign.center,
    );
  }

  Padding textoDescripcionIMC(double imc) {
    String descripcion;

    if (imc < 18.5) {
      descripcion =
          "Estás por debajo de tu peso ideal. Es importante cuidar tu alimentación y consultar a un profesional si es necesario.";
    } else if (imc < 25) {
      descripcion =
          "¡Felicidades! Estás dentro de un rango de peso saludable. Sigue manteniendo un estilo de vida equilibrado.";
    } else if (imc < 30) {
      descripcion =
          "Considera mejorar hábitos de alimentación y realizar más actividad física.";
    } else if (imc < 35) {
      descripcion =
          "Es recomendable acudir a un especialista para controlar tu peso y prevenir enfermedades.";
    } else if (imc < 40) {
      descripcion =
          "Es importante buscar orientación médica para tomar medidas y proteger tu salud.";
    } else {
      descripcion =
          "Necesitas atención médica especializada para evitar complicaciones graves.";
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        descripcion,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
