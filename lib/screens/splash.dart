import 'package:flutter/material.dart';
import 'package:yeva/flutter_icons.dart';
import 'package:yeva/screens/User/user_login.dart';

class Splash extends StatefulWidget {
  //const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Lorem Ipsum dolore sit data",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 50.0,
                letterSpacing: -1,
                //fontFamily:
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff4267B2))),
              onPressed: () {
                print("Entrar com o Facebook");
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      MyFlutterApp.facebook,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Criar conta com o Facebook",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xfff1f3f4))),
              onPressed: () {
                print("Entrar na app com o Google");
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MyFlutterApp.google,
                      color: Colors.red[800],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Criar conta com o Google",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.black54,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserLogin(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Entrar com conta Yeva",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
