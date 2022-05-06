//import 'dart:async';
//import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:yeva/widgets/botao_principal.dart';
//import 'Components/components.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({Key? key}) : super(key: key);

  @override
  State<EsqueciSenha> createState() => EsqueciSenhaState();
}

class EsqueciSenhaState extends State<EsqueciSenha> {
  late TextEditingController _email;
  late bool isTrue = false;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  _sendEmail(email) {
    if (_email.text.isEmpty) {
      const snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Por favor escreva seu email no campo acima",
          style: TextStyle(color: Colors.white),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      setState(() {
        isTrue = true;
      });
    }

    print("Envio de email para recuperacao da senha");

    //isTrue ? onError() : onSucceed();
    /*
    * 
    * Encaminhar para a janela de Sucesso ou de Erro no caso.
    */
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PinVerification()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: const Color(0xff26a64d),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          children: [
            const Text(
              "Recuperar senha",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 50.0,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
                "Insira seu email abaixo, enviaremos um link para recuperar sua senha."),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                labelText: "Escreva seu e-mail",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff26a64d),
                )),
                labelStyle: TextStyle(
                  color: Color(0xff26a64d),
                ),
                focusColor: Color(0xff26a64d),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        _sendEmail(_email.text);
                      },
                      child: const Text("Enviar",
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
            ),
          ],
        )),
      ),
    );
  }
}

class PinVerification extends StatefulWidget {
  const PinVerification({Key? key}) : super(key: key);

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification>
    with TickerProviderStateMixin {
  late TextEditingController pin1;
  late TextEditingController pin2;
  late TextEditingController pin3;
  late TextEditingController pin4;

  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    pin1 = TextEditingController();
    pin2 = TextEditingController();
    pin3 = TextEditingController();
    pin4 = TextEditingController();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: const Color(0xff26a64d),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Confirmação",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50.0,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                  "Escreva o código que lhe enviamos por e-mail para confirmar seu pedido de recuperação sua senha."),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xff26a64d),
                          controller: pin1,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff26a64d),
                            )),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xff26a64d),
                          controller: pin2,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff26a64d),
                            )),
                            focusColor: const Color(0xff26a64d),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xff26a64d),
                          controller: pin3,
                          onChanged: (v) {
                            print(v);
                          },
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff26a64d),
                            )),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusColor: const Color(0xff26a64d),
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xff26a64d),
                          controller: pin4,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff26a64d),
                            )),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusColor: const Color(0xff26a64d),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tempo restante: "),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Center(
                      child: Text(countText),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff26a64d)),
                    ),
                    onPressed: () => controller.reverse(
                        from: controller.value == 0 ? 1.0 : controller.value),
                    child: const Text("Reenviar codigo"),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BotaoPrincipal(
                texto: "Confirmar",
              )
            ],
          ),
        ),
      ),
    );
  }
}
