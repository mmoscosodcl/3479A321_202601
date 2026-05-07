import 'package:flutter/material.dart';
import 'package:laboratorois/models/cell_model.dart';

class MineCell extends StatelessWidget {
  final CellModel cell; // Recibe el estado de esta celda específica
  final VoidCallback onTap; // Recibe la función que debe ejecutar al ser tocada

  const MineCell({
    Key? key, 
    required this.cell,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap, // Ejecuta la función pasada desde el padre
      child: Container(
        decoration: BoxDecoration(
          color: cell.isRevealed ? Colors.white : Colors.grey[400],
          border: Border.all(color: theme.colorScheme.outline, width: 1.5),
        ),
        child: Center(    
          child: cell.isRevealed ? Image.asset(
            'assets/icons/land-mine.png',
            width: 64,
            height: 64,
            fit: BoxFit.contain,
          ) : const SizedBox.shrink(), // Si no está revelada, no muestra nada
        ),
      ),
    );
  }
}