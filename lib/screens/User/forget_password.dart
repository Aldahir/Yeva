import 'package:flutter/material.dart';

class EsqueciSenha extends StatefulWidget {
  //const EsqueciSenha({required Key key}) : super(key: key);

  @override
  State<EsqueciSenha> createState() => EsqueciSenhaState();
}

class EsqueciSenhaState extends State<EsqueciSenha> {
  late TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  _sendEmail(email) {
    if (_email.text.isEmpty) {
      const snackbar =
          SnackBar(content: Text("Por favor preencha todos os campos"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    print("Envio de email para recuperacao da senha");

    /*
    * PageToShow = sendmail != true ? onError() : onSucceed();
    * 
    * Encaminhar para a janela de Sucesso ou de Erro no caso.
    * Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageToShow);
    */
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
                      onPressed: () => {_sendEmail(_email.text)},
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
