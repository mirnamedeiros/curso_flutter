import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final Function() selecionado;

  const Resposta( {
    required this.texto,
    required this.selecionado,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 200,
      child: ElevatedButton(
        onPressed: selecionado,
        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 123, 100, 128),),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}