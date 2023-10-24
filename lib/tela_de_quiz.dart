import 'package:flutter/material.dart';

class TelaDeQuiz extends StatefulWidget {
  const TelaDeQuiz({Key? key}) : super(key: key);

  @override
  State<TelaDeQuiz> createState() => _TelaDeQuizState();
//função para reiniciar os parametros do quiz,
  static void restart() {
      perguntanumero = 0;
      erros          = 0;
      acertos        = 0;
  }

}


List<Map<String, dynamic>> quiz = [
  
  //======pergunta.1======
  {
    "pergunta": "Os mamacos são mamíferos pertencentes a qual ordem?",
    "respostas": [
    "Monotremados",
    "Primatas",
    "Marsupiais",
    "Quirópteros",
    ],
    "alternativa_correta": 1,
  },
 //======pergunta.2====== 
  {
    "pergunta": "Qual tipo de macaco está grafado na nota de 20 reais?",
    "respostas": [
      "Mico-leão-dourado",
      "Donkey Kong e diddy",
      "macaco aranha",
      "macaco prego",
    ],
    "alternativa_correta": 0,
  },
  //======pergunta.3======
  {
    "pergunta": "Que tipo de macaco criou o tarzan?",
    "respostas": [
      "macaco prego",
      "mico",
      "gorila",
      "orangotango",
    ],
    "alternativa_correta": 2,
  },
  //======pergunta.4======
  {
    "pergunta": "Qual o nome do protagonista do filme 'Ed, um macaco muito louco' lançado em 1996?",
    "respostas": [
      "Peter Parker",
      "Jack",
      "Roger Waters", 
      "Jacob Black",
    ],
    "alternativa_correta": 1,
  },
  //======pergunta.5======
  {
    "pergunta": "Qual o menor macaco do mundo?",
    "respostas": [
      "sagui pigmeu",
      "macaco-aranha",
      "Diddy",
      "gorila",
    ],
    "alternativa_correta": 0,
  },
  //======pergunta.6======
  {
    "pergunta": "Que tipo de macacos são nossos parentes distantes?",
    "respostas": [
      "Gorila",
      "Mico",
      "Chimpanzé",
      "Orangotango",
    ],
    "alternativa_correta": 2,
  },
  //======pergunta.7======
  {
    "pergunta": " Qual o nome do macaco ladrão preso no Paquistão?",
    "respostas": [
      "DK",
      "Diddy",
      "Bobby",
      "Mario",
    ],
    "alternativa_correta": 2,
  },
  //======pergunta.8======
  {
    "pergunta": "Qual o nome do macaco protagonista do jogo Donkey Kong Country 1 ? ",
    "respostas": [
      "Dixie Kong",
      "Donkey Kong",
      "Tony Kong",
      "Diddy Kong",
    ],
    "alternativa_correta": 1,
  },
  //======pergunta.9======
  {
    "pergunta": " qual a cor dos orangotangos?",
    "respostas": [
      "Marrom",
      "roxo",
      "Vermelho",
      "Laranja",
    ],
    "alternativa_correta": 3,
  },
  //======pergunta.10======
  {
    "pergunta": "você é um macaco? (seja sincero)",
    "respostas": [
      "Sim",
      "Não",
      "Talvez",
      "UH UH AH AH",
    ],
    "alternativa_correta": 3,
  },
]; // Lista de perguntas // Lista de perguntas

int perguntanumero = 0; // Índice da pergunta atual
int acertos = 0; // Initialize acertos as 0
int erros   = 0; // Initialize erros as 0

class _TelaDeQuizState extends State<TelaDeQuiz> {


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
                colors: [Color.fromARGB(255, 255, 196, 0), Colors.orange, Colors.red],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text('Pergunta ${perguntanumero + 1} de ${quiz.length}', style: const TextStyle(fontSize: 25)),
                ),
                Text('Pergunta: ${quiz[perguntanumero]['pergunta']}', style: const TextStyle(fontSize: 25)),
                // Botões das respostas
                for (int i = 0; i < quiz[perguntanumero]['respostas'].length; i++)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificarResposta(i);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                      ),
                      child: Text(
                        quiz[perguntanumero]['respostas'][i],
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 void verificarResposta(int respostaSelecionada) {
    if (quiz[perguntanumero]['alternativa_correta'] == respostaSelecionada) {
      acertos++; // Incrementa o número de respostas corretas
    } else {
      erros++;
    }

    setState(() {
      if (perguntanumero < quiz.length - 1) {
        perguntanumero++;
      } else {
        _showResults(acertos); // Chama a função _showResults com o número de acertos
      }
  
    });  
  }
    void _showResults(int acertou) {
    Navigator.pushNamed(context, 'Resultados', arguments: acertou);
}
}