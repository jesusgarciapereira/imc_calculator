import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class EstiloBoton {
  static ButtonStyle botonPrincipal = ButtonStyle(
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    backgroundColor: WidgetStateProperty.all(AppColors.primary),
  );
}
