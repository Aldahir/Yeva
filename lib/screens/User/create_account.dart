import 'package:flutter/material.dart';

class NovoUsuer extends StatefulWidget {
  const NovoUsuer({Key? key}) : super(key: key);

  @override
  State<NovoUsuer> createState() => NovoUsuerState();
}

class NovoUsuerState extends State<NovoUsuer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Criar conta"),
        backgroundColor: const Color(0xff26a64d),
      ),
    );
  }
}
