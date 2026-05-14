import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  // Método de inicialización asíncrona
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Setters y Getters (Llave-Valor)
  static Future<void> saveUsername(String name) async {
    await _prefs.setString('username', name);
  }

  static String getUsername() {
    return _prefs.getString('username') ?? 'Jugador 1'; // Fallback por defecto
  }

  static Future<void> saveDifficulty(String difficulty) async {
    await _prefs.setString('difficulty', difficulty);
  }

  static String getDifficulty() {
    return _prefs.getString('difficulty') ?? 'Fácil';
  }
}