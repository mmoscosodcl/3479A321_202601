import 'package:flutter/material.dart';
import 'package:laboratorois/ui/screens/about.dart';
import 'package:laboratorois/ui/screens/menu_screen.dart';
import 'package:laboratorois/ui/widgets/mine_cell.dart';

class MinesweeperScreen extends StatelessWidget {
 const MinesweeperScreen({Key? key}) : super(key: key);

  
  
  Widget _gameBoard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0, // Cuadrado perfecto
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(), // Bloquea el scroll
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, // 8 columnas
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64, // 8x8 = 64 celdas
            itemBuilder: (context, index) {
              return MineCell(index: index); // Cada celda es un widget MineCell
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // 2. Definimos valores por defecto (Fallback) en caso de que lleguen nulos
    final String difficulty = args?['difficulty'] ?? 'Desconocida';
    final int gridSize = args?['gridSize'] ?? 8; // Útil para redimensionar el tablero más adelante



    return Scaffold(
      appBar: AppBar(title: const Text('Buscaminas'),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () => Navigator.pushNamed(context, '/about'),
        ),
        IconButton(
          icon: const Icon(Icons.menu_book_outlined),
          onPressed: () => Navigator.pushNamed(context, '/menu'),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            // Aquí podrías implementar la lógica para reiniciar el juego
            // Por ahora, solo muestra un mensaje
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Reiniciar el juego (funcionalidad pendiente)')),
            );
          },
        ),
      ],),
      body: SafeArea( // Protege la UI de los bordes del dispositivo
        child: Column( // Apila el marcador arriba y el tablero abajo
          children: [
            // Área de Status
            Container(
              height: 60,
              color: Colors.grey[300],
              child: Row(
                children: [
                  const Icon(Icons.timer, size: 30, color: Colors.black54),
                  SizedBox(width: 1),
                  //Icon from assets
                  Image.asset('assets/icons/deadline.png', width: 30, height: 30),
                  SizedBox(width: 1),
                  const Center(
                    child: Text('349 segundos | Minas: 10 | Cuadros: 56', 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Área de Juego
            Expanded( // Expande el tablero para llenar la pantalla
              child: _gameBoard(),
            ),
            SizedBox(height: 10), // Espacio inferior
            Center(
              child: Text('Dificultad: $difficulty | Tamaño: ${gridSize}x$gridSize', 
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
