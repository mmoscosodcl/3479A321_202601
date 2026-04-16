import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú (Maqueta)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pantalla de Menú'),
            // Botones temporales solo para validar la plomería
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/game'),
              child: const Text('Test -> Ir a Juego'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Test -> Ir a Historial'),
            ),
          ],
        ),
      ),
    );
  }
}