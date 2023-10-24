import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int acertou;//armazena dados de arcerto para passar como parametro para o resultado

  const Resultado({Key? key, required this.acertou}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Resultado', style: TextStyle(fontSize: 25),),
                  Text('Você acertou:\n$acertou de 10 perguntas\n', style: const TextStyle(fontSize: 25),),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {Navigator.pushNamed(context, '/');},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(80, 14, 80, 14),
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                      ),
                      child: const Text('Jogar novamente', style: TextStyle(fontSize: 23)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}