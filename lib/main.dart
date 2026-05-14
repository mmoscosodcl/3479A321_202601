import 'package:flutter/material.dart';
import 'package:laboratorois/services/storage_service.dart';
import 'package:laboratorois/ui/screens/about.dart';
import 'package:laboratorois/ui/screens/history_screen.dart';
import 'package:laboratorois/ui/screens/menu_screen.dart';
import 'package:laboratorois/ui/screens/minesweeper_screen.dart';
import 'package:laboratorois/ui/screens/settings.dart';
import 'package:laboratorois/viewmodels/game_viewmodel.dart';
import 'package:laboratorois/viewmodels/settings_viewmodel.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

var logger = Logger();

void main() async {

  logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  //logger.e('Iniciando la aplicación de Buscaminas'); // Error

  // 1. Asegura que los bindings de Flutter con el motor nativo del SO estén listos
  WidgetsFlutterBinding.ensureInitialized(); 
  
  // 2. Inicializamos nuestro servicio de infraestructura
  await StorageService.init();
  runApp(
    MultiProvider(
      providers: [
        // Este Provider NACE cuando la app se abre y MUERE cuando la app se cierra.
        // Es perfecto para configuraciones, temas (Dark/Light mode) o sesiones de usuario.
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
      ],
      child: const MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Buscaminas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, 
          primary: Colors.deepPurple,
          secondary: const Color.fromARGB(255, 8, 252, 0)
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 75, 169), // Fondo por defecto de todas las pantallas
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/menu', 
      // Mapa centralizado de Rutas Nombradas
      routes: {
        '/menu': (context) => const MenuScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/game': (context) => ChangeNotifierProvider(
          create: (context) => GameViewModel(),
          child: MinesweeperScreen(), // Notar que ahora GameScreen vuelve a ser una constante
         ),
        '/history': (context) => HistoryScreen(),
        '/about': (context) => const AboutScreen(),
      },
   );
 }
}
  