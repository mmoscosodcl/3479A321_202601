import 'dart:math';

import 'package:flutter/material.dart';
import '../models/cell_model.dart';

class GameViewModel extends ChangeNotifier {
  List<CellModel> _cells = [];
  bool _isGameOver = false; // Estado de la partida

  bool get isGameOver => _isGameOver;
  List<CellModel> get cells => _cells;

  GameViewModel() {
    _generateBoard();
  }

  void _generateBoard() {
    // 1. Creamos las 64 celdas vacías
    _cells = List.generate(64, (i) => CellModel(index: i));

    // 2. Sembrar 10 bombas aleatorias
    Random random = Random();
    int bombsPlanted = 0;
    while (bombsPlanted < 10) {
      int index = random.nextInt(64);
      if (!_cells[index].isBomb) {
        _cells[index].isBomb = true;
        bombsPlanted++;
      }
    }
  }

  void revealCell(int index) {
    if (_isGameOver || _cells[index].isRevealed) return;

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