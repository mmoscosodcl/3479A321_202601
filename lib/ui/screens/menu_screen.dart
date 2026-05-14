import 'package:flutter/material.dart';
import 'package:laboratorois/services/storage_service.dart';
import 'package:laboratorois/viewmodels/settings_viewmodel.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsVM = context.watch<SettingsViewModel>();
    
    final playerName = settingsVM.username.isNotEmpty ? settingsVM.username : 'Jugador Anónimo';
    final savedDifficulty = StorageService.getDifficulty();
    return Scaffold(
      appBar: AppBar(title: const Text('Menú (Maqueta)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido, $playerName', style: const TextStyle(fontSize: 24)),
            const Text('Pantalla de Menú'),
            // Botones temporales solo para validar la plomería
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                  context, 
                  '/game', 
                  arguments: {'difficulty': 'Facil', 'gridSize': 8},
                ),
              child: Text('Nueva Partida ($savedDifficulty)'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Test -> Ir a Historial'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('Test -> Ir a Ajustes'),
            ),
          ],
        ),
      ),
    );
  }
}