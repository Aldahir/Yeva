import 'package:flutter/material.dart';
import 'package:yeva/screens/User/user_login.dart';

class Falha extends StatefulWidget {
  const Falha({Key? key}) : super(key: key);

  @override
  State<Falha> createState() => _FalhaState();
}

class _FalhaState extends State<Falha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.close_rounded,
                size: 160,
                color: Colors.redAccent,
              ),
              const Text(
                "Algo de errado!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 40.0,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Não conseguimos recuperar sua senha,\npor favor tente novamente.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Erro: hdhgfgfkjfkjgfgjfk",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Okay",
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800)),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff26a64d)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
              )
            ],
          )),
    );
  }
}
