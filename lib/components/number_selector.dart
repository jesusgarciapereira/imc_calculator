import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class SelectorNumero extends StatefulWidget {
  final String titulo;
  final int valor;
  final Function() incrementar;
  final Function() decrementar;

  const SelectorNumero({
    super.key,
    required this.titulo,
    required this.valor,
    required this.incrementar,
    required this.decrementar,
  });

  @override
  State<SelectorNumero> createState() => _SelectorNumeroState();
}

class _SelectorNumeroState extends State<SelectorNumero> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(widget.titulo, style: EstiloTexto.bodyText),
            Text(
              widget.valor.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Restar
                FloatingActionButton(
                  onPressed: () {
                    widget.decrementar();
                  },
                  shape: CircleBorder(), // Borde circular
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
                SizedBox(width: 16),
                // Incrementar
                FloatingActionButton(
                  onPressed: () {
                    widget.incrementar();
                  },
                  shape: CircleBorder(), // Borde circular
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
