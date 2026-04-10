import 'package:flutter/material.dart';
import 'package:laboratorois/ui/screens/minesweeper_screen.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() {

  logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  logger.e('Iniciando la aplicación de Buscaminas'); // Error
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Buscaminas',
     //theme: ThemeData(primarySwatch: Colors.blue),
      theme: ThemeData(
        // colorScheme: Es el estándar moderno en Material 3 para paletas de colores
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // Color base, Flutter calcula el resto
          primary: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor: Colors.grey[100], // Fondo por defecto de todas las pantallas
        // Centralizamos la tipografía general
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
     home: const MinesweeperScreen(), // Apuntamos a nuestra nueva pantalla
   );
 }
}
