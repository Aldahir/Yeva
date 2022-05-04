import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  const Titulo({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(texto,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
        //style: const TextStyle(fontSize: 25, color: Colors.black, letterSpacing: -1, fontWeight: FontWeight.w800)
    );
  }
}
