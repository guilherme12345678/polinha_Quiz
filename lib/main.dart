//===================================================================================
//==================QUIZ - MAMACOS===================================================
//Alunos: Paula Melissa Ribeiro Moura e Eric da Silva Vieira 2º informática matutino.

import 'package:flutter/material.dart';
import 'package:login/tela_de_quiz.dart';
import 'package:login/tela_inicio.dart';
import 'package:login/resultados.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Telainicio(),
        'Quiz': (context) => const TelaDeQuiz(),
        'Resultados': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as int; // Obtém o número de acertos para retornar como argumento 
          return Resultado(acertou: args);
        },
      },
    );
  }
}