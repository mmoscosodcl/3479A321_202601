// En lib/ui/screens/about_screen.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me (Tema Activo)'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Usa el fondo del tema
        ),
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Esta pantalla hereda el diseño global.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context), // Navegación de regreso
                child: const Text('Volver'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}