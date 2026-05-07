import 'package:flutter/material.dart';
import 'package:laboratorois/ui/screens/about.dart';
import 'package:laboratorois/ui/screens/history_screen.dart';
import 'package:laboratorois/ui/screens/menu_screen.dart';
import 'package:laboratorois/ui/screens/minesweeper_screen.dart';
import 'package:laboratorois/viewmodels/game_viewmodel.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

var logger = Logger();

void main() {

  logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  //logger.e('Iniciando la aplicación de Buscaminas'); // Error
  runApp(const MyApp());
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
  