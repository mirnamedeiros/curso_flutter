import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;

  final Function() reiniciarQuestionario;

  const Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 10 ) {
      return 'Tá fraco.';
    }
    else if (pontuacao == 20) {
      return 'Marrapais, tu é bom mesmo!';
    }
    else {
      return 'Quase lá...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: reiniciarQuestionario, 
          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 123, 100, 128)),
          child: const Text('Reiniciar',style: TextStyle(fontSize: 18),),
        )
      ],
    );
  }
}