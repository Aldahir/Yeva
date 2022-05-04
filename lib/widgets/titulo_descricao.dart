import 'package:flutter/material.dart';

class Descricao extends StatelessWidget {
  const Descricao({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
          fontSize: 12.0, color: Colors.black45, fontWeight: FontWeight.normal),
      //style: const TextStyle(fontSize: 15, color: Colors.black38, letterSpacing:0, fontWeight: FontWeight.normal)
    );
  }
}
