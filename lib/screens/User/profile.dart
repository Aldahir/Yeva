import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  //const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final int _id = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          title: const Text(
            "Perfil",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w800,
                color: Colors.black,),
          ),
        ),*/
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.black12,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          AssetImage('assets/img/yeva_logo_icon_original.png'),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$_id Livros lidos",
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  "$_id Dias",
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(
              width: 1.0,
            ),
            const Text(
              "Map<String, dynamic>Dias da semana ",
              style: TextStyle(fontSize: 18.0, color: Colors.red),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black12),
              padding: EdgeInsets.only(top: 15, bottom: 15),
              margin: const EdgeInsets.all(0),
              child: Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("@joao.alexandre"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.military_tech,
                      color: Color.fromRGBO(255, 143, 0, 1),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("35"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black12),
              padding: EdgeInsets.only(top: 15, bottom: 15),
              margin: const EdgeInsets.all(0),
              child: Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("@joao.alexandre"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.military_tech,
                      color: Color.fromRGBO(255, 143, 0, 1),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("35"),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
