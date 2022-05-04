import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget{
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late List _items;
  int menuItem = 0;

  @override
  void initState() {
    super.initState();
    menuItem = 1;
  }

  void _escolherItem(int item){
    setState(() {
      menuItem = item;
    });
  }

  Future<void> _getUsersList() async{
    final String file = await rootBundle.loadString('assets/data/db.json');
    var response = await jsonDecode(file);

    setState(() {
      _items = response;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: _getUsersList,
                  child: const Text('Carregar usuarios')),
              _items.isEmpty ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, i){
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Text(_items[i]['id']),
                          title: Text(_items[i]['name']),
                        ),
                      );
                    },
                  ),
              ) : Container()
            ],
          )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: 'Biblioteca',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            label: 'Playlist',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
        currentIndex: menuItem,
        unselectedItemColor:  Colors.black12,
        selectedItemColor: const Color(0xff26a64d),
        onTap: _escolherItem,
      ),
    );
  }
}
