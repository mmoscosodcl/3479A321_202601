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
    _calculateAdjacentMines(); // Llamar a este método al final de _generateBoard()
  }

  void _calculateAdjacentMines() {
    int size = 8; // Tamaño del grid (ej. 8x8)
    
    for (int i = 0; i < _cells.length; i++) {
      if (_cells[i].isBomb) continue; // Si es bomba, no calculamos

      int row = i ~/ size; // Fila actual
      int col = i % size;  // Columna actual
      int count = 0;

      // Iteramos sobre los 8 vecinos posibles (arriba, abajo, diagonales)
      for (int r = -1; r <= 1; r++) {
        for (int c = -1; c <= 1; c++) {
          if (r == 0 && c == 0) continue; // Somos nosotros mismos

          int newRow = row + r;
          int newCol = col + c;

          // Verificamos que el vecino esté dentro de los límites del tablero
          if (newRow >= 0 && newRow < size && newCol >= 0 && newCol < size) {
            int neighborIndex = (newRow * size) + newCol;
            if (_cells[neighborIndex].isBomb) {
              count++;
            }
          }
        }
      }
      _cells[i].adjacentMines = count;
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