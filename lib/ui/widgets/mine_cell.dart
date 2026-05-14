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


  Widget _buildCellContent() {
    if (!cell.isRevealed) return const SizedBox.shrink();
    if (cell.isBomb) return Image.asset('assets/icons/deadline.png', width: 40);

    // Si no hay minas adyacentes, mostramos vacío en lugar de "0"
    if (cell.adjacentMines == 0) return const SizedBox.shrink();

    // Colores clásicos del buscaminas
    Color numberColor;
    switch (cell.adjacentMines) {
      case 1: numberColor = Colors.blue; break;
      case 2: numberColor = Colors.green; break;
      case 3: numberColor = Colors.red; break;
      case 4: numberColor = Colors.purple; break;
      default: numberColor = Colors.black;
    }

    return Text(
      '${cell.adjacentMines}',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: numberColor),
    );
  }


  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap, // Ejecuta la función pasada desde el padre
      child: Container(
        decoration: BoxDecoration(
          color: cell.isRevealed ? (cell.isBomb ? Colors.red[100] : Colors.white) 
            : Colors.grey[300],
          border: Border.all(color: theme.colorScheme.outline, width: 1.5),
        ),
        child: Center(    
          child: _buildCellContent() // Si no está revelada, no muestra nada
        ),
      ),
    );
  }
}