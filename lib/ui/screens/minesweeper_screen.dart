import 'package:flutter/material.dart';
import 'package:laboratorois/ui/screens/about.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Buscaminas'),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_outline),
          
          onPressed: () {
            // Aquí podrías navegar a una pantalla de "Acerca de"
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
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
          ],
        ),
      ),
    );
  }
}
