import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'pergunta': 'O que combina com linguiça ?',
      'respostas': [
        {'texto': 'Catchup','pontuacao':10},
        {'texto': 'Maionese','pontuacao':5},
        {'texto': 'Mostarda','pontuacao':3},
      ]
    },
    {
      'pergunta': 'A comida fica melhor...',
      'respostas': [
        {'texto': 'Na quintura do inferno','pontuacao':10},
        {'texto': 'Temperatura ambiente','pontuacao':5}, 
        {'texto': 'Gelada','pontuacao':3},
      ]
    },
    {
      'pergunta': 'Qual o seu tipo de ovo preferido ?',
      'respostas': [
        {'texto': 'Frito sem mexer','pontuacao':10},
        {'texto': 'Mexido','pontuacao':5},
        {'texto': 'Cozido','pontuacao':3},
      ]
    },
  ];

  void _responder (int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
              'Perguntas',
            ),
          backgroundColor: const Color.fromARGB(255, 123, 100, 128),
        ),
        body: temPerguntaSelecionada 
        ? Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, responder: _responder)
        : Resultado(_pontuacaoTotal, reiniciarQuestionario)
      ),
    );
  }
}

