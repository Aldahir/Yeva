import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yeva/Screens/Playlist/overview_playlist.dart';
import 'package:yeva/screens/User/user_settings.dart';
import 'package:yeva/widgets/list_card.dart';

class Playlist extends StatefulWidget {
  late int id;
  final String titulo = "Playlist";
  Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  late final String string =
      '[{"id": 1,"titulo": "Minha playlist","descricao":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","userid": 2,"created": "2021-04-22","estado": 1},{"id": 2,"titulo": "Romances","descricao":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","userid": 2,"created": "2021-04-22","estado": 1},{"id": 3,"titulo": "Contos de verão","descricao":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","userid": 2,"created": "2021-04-22","estado": 1},{"id": 4,"titulo": "Receitas deliciosas","descricao":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","userid": 2,"created": "2021-04-22","estado": 1},{"id": 5,"titulo": "Livros sobre emponderamento da mulher","descricao":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "userid": 2,"created": "2021-04-12","estado": 1}]';
  late List _list = [];
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _list = [];
    // });
    _fetchData();
  }

  _fetchData() async {
    List resp = await jsonDecode(string);
    setState(() {
      _list = resp;
      //print(resp);
    });
  }

  _showMessage(String message) {
    SnackBar snackbar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.white,
      content: Text(message, style: const TextStyle(color: Colors.black)),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(widget.titulo),
        titleTextStyle: const TextStyle(
            fontSize: 30,
            letterSpacing: -1,
            fontWeight: FontWeight.w800,
            color: Color(0xff26ad26)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserSettings()));
              },
              icon: const Icon(
                Icons.settings,
                color: Color(0xff26ad26),
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: 430, child: ListCard(data: _list)),
            TextButton(
                style: const ButtonStyle(
                  alignment: Alignment.center,
                ),
                onPressed: () =>
                    _showMessage("Ver todas as playlists do utilizador"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Exibir minhas playlists",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Icon(
                      Icons.expand_more,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                  ],
                )),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var text =
                      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
                  var descricao = text.replaceRange(70, text.length, '...');
                  return TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaylistOverview(id: index))),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.zero)),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                //width: 80,
                                height: 100,
                                decoration: BoxDecoration(
                                    //color: Colors.amber,
                                    borderRadius: BorderRadius.circular(4.0),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://dummyimage.com/300x375/fbc86ab/fff'),
                                      fit: BoxFit.cover,
                                      repeat: ImageRepeat.noRepeat,
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                //width: 200,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Artista do Livro $index",
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color: const Color.fromARGB(
                                                190, 0, 0, 0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "4.7",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Titulo do Livro $index",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          //width: 180,
                                          child: Text(
                                            "Some text $descricao",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 11,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.zero,
                                            //height: 30,
                                            //width: 30,
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                iconSize: 40,
                                                onPressed: () => _showMessage(
                                                    "Reproduzir a playlist id $index"),
                                                icon: const Icon(
                                                  Icons.play_circle,
                                                  color: Color(0xff26ad26),
                                                  //size: 40,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            TextButton(
                style: const ButtonStyle(
                  alignment: Alignment.center,
                ),
                onPressed: () =>
                    _showMessage("Ver todas as playlists do sistema"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Exibir todas as recomendações",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Icon(
                      Icons.expand_more,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                  ],
                )),
          ]),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      //   elevation: 0,
      //   foregroundColor: Colors.white,
      //   backgroundColor: const Color(0xff26ad26),
      // ),
    );
  }
}
