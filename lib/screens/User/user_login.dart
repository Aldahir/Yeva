import 'package:flutter/material.dart';
import 'package:yeva/models/user.dart';
import 'package:yeva/screens/User/forget_password.dart';
import 'package:yeva/Dao/yeva.dart';
import 'dart:convert';

import 'package:yeva/screens/home.dart';

class UserLogin extends StatefulWidget {
  final titulo = "Login";
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  //late String _titleProgress;
  late TextEditingController _username;
  late TextEditingController _password;
  final FocusNode _focusNode = FocusNode();
  late Color color;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
    // _titleProgress = widget.titulo;
  }

  _clearInputs() {
    _username.text = "";
    _password.text = "";
  }

  Future _loadUserData(context, id) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  void _showSnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  _showValues(User user) {
    _username.text = user.nome;
    _password.text = user.id as String;
  }

  _login(context, user, senha) {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 7),
          backgroundColor: Colors.redAccent,
          content: Text("Campos vazios. Por favor preencha todos os campos",
              style: TextStyle(color: Colors.white)),
        ),
      );
    }

    //_showProgress('Entrar');

    YevaController.loginUser(user, senha).then((result) {
      Map<String, dynamic> data = jsonDecode(result);

      print("login >>>>>>>>>>>>>>> ${data}");
      if (data['estado'] == '1') {
        _loadUserData(context, int.parse(data['id']));
      } else {
        _clearInputs();
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 7),
            backgroundColor: Colors.redAccent,
            content: Text("Senha ou usuario errada. Tente novamente!",
                style: TextStyle(color: Colors.white)),
          ),
        );
      }
    });
  }

  /*_showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        color = _focusNode.hasFocus ? const Color(0xff26a64d) : Colors.black54;
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: const Color(0xff26a64d),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _username,
                decoration: const InputDecoration(
                  labelText: "Seu nome de usuário",
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
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                controller: _password,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Color(0xff26a64d),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xff26a64d),
                    )),
                    border: OutlineInputBorder(),
                    labelText: "Sua senha"),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () => setState(() {
                        _login(context, _username.text, _password.text);
                      }),
                      child: const Text("Entrar",
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
                            borderRadius: BorderRadius.circular(5.0),
                            //side: BorderSide(color: Color(0xffff0026)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: (() => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EsqueciSenha(),
                          )),
                    }),
                child: const Text(
                  "Esqueceu sua Senha",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black),
                ))
          ]),
    );
  }
}
