
class GameResult {
  final String date;
  final String timeSpent;
  final bool isVictory;
  final String difficulty; // Nuevo campo para explorar más widgets

  GameResult({
    required this.date,
    required this.timeSpent,
    required this.isVictory,
    required this.difficulty,
  });
}