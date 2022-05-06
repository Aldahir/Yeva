import 'package:flutter/material.dart';
import 'package:yeva/screens/home.dart';
import 'package:yeva/screens/User/user_settings.dart';

class Biblioteca extends StatefulWidget {
  final String titulo = "Biblioteca";
  //const Biblioteca({Key? key}) : super(key: key);

  @override
  State<Biblioteca> createState() => BibliotecaState();
}

class BibliotecaState extends State<Biblioteca> {
  late int initialIndex;
  @override
  void initState() {
    super.initState();
    initialIndex = 0;
  }

  _showMessage(String message) {
    SnackBar snackbar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xff26ad26),
      content: Text(message, style: const TextStyle(color: Colors.white)),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
          //backgroundColor: Colors.white,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserSettings()));
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Color(0xff26ad26),
                    size: 30,
                  ))
            ],
            bottom: const TabBar(
              labelColor: Colors.black,
              labelPadding: EdgeInsets.only(top: 2.50, bottom: 2.50),
              indicatorColor: Color(0xff26ad26),
              tabs: [
                Tab(
                  child: Text(
                    "Lendo",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    "Lidos",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    'Favoritos',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    'Comentários',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 8, left: 8, bottom: 0),
                child: Column(
                  children: [
                    const Text("data"),
                    TextButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero)),
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              repeat: ImageRepeat.noRepeat,
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(0, 0, 0, .3),
                                  BlendMode.multiply),
                              image: NetworkImage(
                                  'https://dummyimage.com/600x400/cbe00eb/fff')),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 15.0, right: 15.0, bottom: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const [
                              Text("categoria",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              Text(
                                "descricao",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 8, bottom: 8.0),
                      ),
                      onPressed: () {
                        _showMessage("message");
                      },
                    ),
                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                'https://dummyimage.com/300x375/f2315d/fff'),
                                            fit: BoxFit.cover,
                                            repeat: ImageRepeat.noRepeat,
                                          )),
                                      child: Center(
                                        child: IconButton(
                                            padding: EdgeInsets.zero,
                                            iconSize: 40,
                                            onPressed: () => _showMessage(
                                                "Reproduzir a playlist id $index"),
                                            icon: const Icon(
                                              Icons.play_circle,
                                              color: Colors.white,
                                              //size: 40,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Artista do Livro $index",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700),
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
                                          Container(
                                            width: 700,
                                            child: Slider(
                                                activeColor:
                                                    const Color(0xff26ad26),
                                                thumbColor:
                                                    const Color(0xff26ad26),
                                                value: 1,
                                                onChanged: (v) {
                                                  _showMessage("$v");
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }))
                  ],
                ),
              ),
            ),
            const Center(
              child: Text("data"),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Nenhum livros nos seus favoritos.\n Adicione um agora mesmo",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ))),
                    child: const Text(
                      "Toque aqui para descobrir novos audiobooks",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Voce nao comentou nenhum livro ainda",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ))),
                    child: const Text(
                      "Toque aqui para descobrir novos artigos",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ])));
}
