import 'package:flutter/material.dart';
import 'package:laboratorois/viewmodels/settings_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../services/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _nameController;
  String _selectedDifficulty = 'Fácil';

  @override
  void initState() {
    super.initState();
    // LEEMOS los datos persistidos al iniciar la pantalla
    _nameController = TextEditingController(text: StorageService.getUsername());
    _selectedDifficulty = StorageService.getDifficulty();
  }

  void _saveSettings() async {
    // GUARDAMOS en el dispositivo
    await StorageService.saveUsername(_nameController.text);
    await StorageService.saveDifficulty(_selectedDifficulty);
    
    if (mounted) {

      //Notificamos a todas las pantallas que estén escuchando este ViewModel que algo cambió
      context.read<SettingsViewModel>().refreshSettings();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configuración guardada en el dispositivo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre del Jugador'),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedDifficulty,
              isExpanded: true,
              items: ['Fácil', 'Medio', 'Difícil'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() => _selectedDifficulty = newValue!);
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Guardar Configuración'),
            ),
          ],
        ),
      ),
    );
  }
}