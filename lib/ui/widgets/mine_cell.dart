import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
    final int index;
    
    const MineCell({
      Key? key, 
      required this.index, // Parámetro obligatorio en el constructor
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor, // Color de fondo suave
        border: Border.all(color: theme.colorScheme.outline, width: 1.5),
      ),
      child: Center(    
        child: Text(
          '$index', // Interpolación: inyecta el valor de la variable en el texto
          style: TextStyle(color: theme.textTheme.bodyMedium?.color ?? Colors.black26, fontSize: 10),
        ), // Aquí se mostrarán las minas o números
      ),
    );
  }
}