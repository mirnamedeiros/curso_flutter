import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario( {
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
    super.key
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> textoRespostas = temPerguntaSelecionada 
                                  ? perguntas[perguntaSelecionada].cast()['respostas'] 
                                  : [];

    List<dynamic> respostas = textoRespostas
                            .map((resp) {
                              return Resposta(texto: resp['texto'].toString(),
                                               selecionado: () => responder(int.parse(resp['pontuacao'].toString())));
                            })
                            .toList();

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['pergunta'].toString()),
        ...respostas
      ],
    );
  }
}