// lib/viewmodels/settings_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:laboratorois/services/storage_service.dart';

class SettingsViewModel extends ChangeNotifier {
  String _username = StorageService.getUsername();
  
  String get username => _username;

  void refreshSettings() {
    _username = StorageService.getUsername();
    notifyListeners(); // Notifica a todas las pantallas que usen este valor
  }
}