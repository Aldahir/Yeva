import 'package:flutter/material.dart';
import 'package:yeva/widgets/falha.dart';
import 'sucesso.dart';

class BotaoPrincipal extends StatelessWidget {
  String texto;
  BotaoPrincipal({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                //controller.dispose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Sucesso()));
              },
              child: Text(texto,
                  style: const TextStyle(
                      height: 1.5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800)),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff26a64d)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    //side: BorderSide(color: Color(0xffff0026)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
