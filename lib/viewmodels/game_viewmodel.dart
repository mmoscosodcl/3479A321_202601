import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../models/cell_model.dart';

class GameViewModel extends ChangeNotifier {
  List<CellModel> _cells = [];
  bool _isGameOver = false; // Estado de la partida

  bool get isGameOver => _isGameOver;
  List<CellModel> get cells => _cells;

  // Variables del Reloj
  Timer? _timer;
  int secondsElapsed = 0;
  bool _isFirstTap = true;

  final int gridSize; 
 late int totalCells;

  get seconds => secondsElapsed;

  GameViewModel({required this.gridSize}) {
    totalCells = gridSize * gridSize; // Ej: 10x10 = 100 celdas
    _generateBoard();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed++;
      notifyListeners(); // Avisamos a la UI que actualice el reloj
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _generateBoard() {
    // 1. Creamos las 64 celdas vacías
    _cells = List.generate(totalCells, (i) => CellModel(index: i));

    // 2. Sembrar 10 bombas aleatorias
    Random random = Random();
    int bombsPlanted = 0;
    while (bombsPlanted < 10) {
      int index = random.nextInt(totalCells);
      if (!_cells[index].isBomb) {
        _cells[index].isBomb = true;
        bombsPlanted++;
      }
    }
    _calculateAdjacentMines();
  }

  void _calculateAdjacentMines() {
    for (int i = 0; i < _cells.length; i++) {
      if (_cells[i].isBomb) continue;

      int row = i ~/ gridSize;
      int col = i % gridSize;
      int count = 0;

      for (int r = -1; r <= 1; r++) {
        for (int c = -1; c <= 1; c++) {
          if (r == 0 && c == 0) continue;
          int newRow = row + r;
          int newCol = col + c;

          if (newRow >= 0 && newRow < gridSize && newCol >= 0 && newCol < gridSize) {
            int neighborIndex = (newRow * gridSize) + newCol;
            if (_cells[neighborIndex].isBomb) count++;
          }
        }
      }
      _cells[i].adjacentMines = count;
    }
  }
  void revealCell(int index) {
    if (_isGameOver || _cells[index].isRevealed) return;

    if (_isFirstTap) {
      _startTimer();
      _isFirstTap = false;
    }


    _cells[index].isRevealed = true;

    // Si toca una bomba, el juego termina
    if (_cells[index].isBomb) {
      _isGameOver = true;
      _revealAll(); // Función auxiliar para mostrar todo al morir
    }

    notifyListeners(); 
  }


  void _revealAll() {
    for (var cell in _cells) {
      cell.isRevealed = true;
    }
  }
}