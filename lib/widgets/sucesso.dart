import 'package:flutter/material.dart';
import 'package:yeva/screens/User/user_login.dart';

class Sucesso extends StatefulWidget {
  const Sucesso({Key? key}) : super(key: key);

  @override
  State<Sucesso> createState() => _SucessoState();
}

class _SucessoState extends State<Sucesso> {
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
                Icons.verified,
                size: 160,
                color: Color(0xff26a64d),
              ),
              const Text(
                "Sucesso",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50.0,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Seu senha foi recuperada com êxito!"),
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
                          //controller.dispose();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLogin()));
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
