import 'package:flutter/material.dart';
import 'package:laboratorois/core/services/storage_services.dart';
import 'package:laboratorois/viewmodels/setting_viewmodel.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final settingsVM = context.watch<SettingsViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Menú (Maqueta)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                const Icon(Icons.grid_on, size: 80, color: Colors.deepPurple),
                const SizedBox(height: 16),
                
                Text(
                  '¡Hola, ${settingsVM.username}!',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                // Tarjeta de Información
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text('Configuración Actual', style: TextStyle(color: Colors.grey)),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.dashboard, color: Colors.deepPurple),
                          title: Text('Dificultad: ${settingsVM.difficulty}'),
                          subtitle: Text('Tablero de ${settingsVM.gridSize}x${settingsVM.gridSize}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => Navigator.pushNamed(context, '/settings'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Botón Jugar
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow, size: 28),
                    label: const Text('NUEVA PARTIDA', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/game'),
                  ),
                ),
                const SizedBox(height: 16),
                
                TextButton.icon(
                  icon: const Icon(Icons.history),
                  label: const Text('Ver Historial de Partidas'),
                  onPressed: () => Navigator.pushNamed(context, '/history'),
                ),
              ],
        ),
      ),
    );
  }
}