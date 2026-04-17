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

  // En lib/ui/screens/history_screen.dart, dentro del método build()
    final List<GameResult> listMaqueta = [
      GameResult(date: '10 Abr', timeSpent: '01:20', isVictory: true, difficulty: 'Fácil'),
      GameResult(date: '09 Abr', timeSpent: '04:45', isVictory: false, difficulty: 'Difícil'),
      GameResult(date: '08 Abr', timeSpent: '02:10', isVictory: true, difficulty: 'Medio')
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial (Maqueta)')),
      body: 
        ListView.builder(itemBuilder: (context, index) {
          final game = listMaqueta[index];
          return GameResultUI(game: game); // GameResultUI es el widget personalizado que creamos en los pasos anteriores (refactor) 
        },
        itemCount: listMaqueta.length,
        ),
    );
  }
}

class GameResultUI extends StatelessWidget {
  const GameResultUI({
    super.key,
    required this.game,
  });

  final GameResult game;

  @override
  Widget build(BuildContext context) {
    return Center(
      
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
      
          );
  }
}