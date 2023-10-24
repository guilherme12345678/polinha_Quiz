import 'package:flutter/material.dart';
import 'package:login/tela_de_quiz.dart';

class Telainicio extends StatelessWidget {
  const Telainicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.yellow, Colors.orange, Colors.red],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                    scale: 1.0, // Ajuste esse valor conforme necessário
                    child: Image.asset('assets/images/logoquiz1.png'),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        TelaDeQuiz.restart();
                        Navigator.pushNamed(context, 'Quiz');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0)
                      ),
                      child: const Text('Jogar', style: TextStyle(fontSize: 30)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 