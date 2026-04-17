import 'package:flutter/material.dart';
import 'package:laboratorois/models/game_result.dart';

class HistoryScreen extends StatelessWidget {
   HistoryScreen({super.key});

  final GameResult game = GameResult(
    date: '2024-06-01',
    timeSpent: '5m 30s',
    isVictory: true,
    difficulty: 'Medio',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial (Maqueta)')),
      body: Center(
        child: 
         Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Fecha: ${game.date}'),
                Text('Tiempo: ${game.timeSpent}')
              ],
            ),
          ),
         ) 
          
      ),
    );
  }
}