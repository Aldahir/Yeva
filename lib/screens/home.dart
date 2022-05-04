import 'package:flutter/material.dart';
import 'package:yeva/screens/Biblioteca/biblioteca.dart';
import 'package:yeva/screens/Descobrir/descobrir.dart';
import 'package:yeva/screens/Playlist/playlist.dart';
import 'package:yeva/Screens/User/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    Descobrir(),
    Biblioteca(),
    const Center(
        child: Text(
      'data 3',
      style: TextStyle(fontSize: 50),
    )),
    Playlist(),
    Profile()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        //toolbarOpacity: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserSettings(),
                    ));
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Color(0xff26a64d),
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),*/
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 20.0,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 13.0,
          ),
          selectedItemColor: const Color(0xff26a64d),
          unselectedItemColor: Colors.black26,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.public), label: "Descobrir"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), label: "Biblioteca"),
            BottomNavigationBarItem(
                icon: Icon(Icons.redeem), label: "Convidar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.queue_music), label: "Playlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ]),
    );
  }
}
