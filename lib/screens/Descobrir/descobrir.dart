import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeva/Screens/User/user_settings.dart';
import 'package:yeva/screens/Player/player.dart';
import 'package:yeva/widgets/titulo.dart';
import 'package:yeva/widgets/titulo_descricao.dart';

class Descobrir extends StatefulWidget {
  final String titulo = "Descubra";

  @override
  State<Descobrir> createState() => DescobrirState();
}

class DescobrirState extends State<Descobrir> {
  late String _title;
  late List _categorias = [];
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _categorias = [];
    setState(() {
      _title = widget.titulo;
    });
    _getCategorias();
  }

  _getCategorias() async {
    final response = await http.get(Uri.parse(
        "https://imfcconsulting.com/lerProduto.php?role=getCategoria"));
    List pa = jsonDecode(response.body);
    setState(() {
      _categorias = pa;
    });
  }

  _getLivroDoDia() async {}

  _getRecomendado() async {}

  _getNovos() async {}

  _getPlaylists() async {}

  _showMessage(String message) {
    SnackBar snackbar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xff26ad26),
      content: Text(message, style: const TextStyle(color: Colors.white)),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Widget builGridView() {
    return Container(
      height: 185,
      margin: const EdgeInsets.only(
        top: 8,
        //right: 20.0,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          mainAxisExtent: 130,
        ),
        scrollDirection: Axis.horizontal,
        //padding: const EdgeInsets.all(3.0),
        itemCount: _categorias.length,
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () => _showMessage(
                  "Abrir os livros com a categoria id ${_categorias[index]['categoria_nome']}"),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 230, 255, 217),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     blurRadius: 2.0,
                    //     color: Color.fromARGB(255, 211, 255, 188),
                    //     offset: Offset(0.0, 1.0),
                    //   )
                    // ]
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      _categorias[index]['categoria_nome'],
                      style:
                          const TextStyle(fontSize: 10.0, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  )));
        },
      ),
    );
  }

  Widget cardNovosNoApp(data) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      // height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue[900],
      ),
      child: TextButton(
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            alignment: Alignment.bottomCenter),
        onPressed: () {
          _showMessage(
              "Abrir o livro para ler detalhes e se puder reproduzir  ${data + 1}");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  "Teste $data",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  _showMessage("Adicionar a playlist id ${data + 1}");
                },
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                iconSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallPlayer() {
    const String backward = "assets/img/icons/backward.svg";
    const String forward = "assets/img/icons/forward.svg";
    const String text = "Vida e obra de Pi";
    String titulo = text.replaceRange(17, text.length, "...");
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black45,
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 0))
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: NetworkImage(
                    "https://dummyimage.com/200x200/cdb880/ffffff.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Text(titulo, overflow: TextOverflow.fade),
          SizedBox(
            width: 30,
            child: TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                backward,
                color: Colors.black,
                height: 14,
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                      const Size.fromWidth(20.0)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero)),
            ),
          ),
          SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.play_circle_fill,
                color: Color(0xff26ad26),
                size: 40,
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                      const Size.fromWidth(20.0)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero)),
            ),
          ),
          SizedBox(
            width: 30,
            child: TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                forward,
                color: Colors.black,
                height: 14,
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                      const Size.fromWidth(20.0)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero)),
            ),
          ),
          SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.expand_less_rounded,
                color: Colors.grey,
                size: 30,
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                      const Size.fromWidth(20.0)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(widget.titulo),
        titleTextStyle: const TextStyle(
            fontSize: 30,
            letterSpacing: -1,
            fontWeight: FontWeight.w900,
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
      body: Stack(children: [
        SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 20.0, right: 0, top: 0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  _showMessage("Ler ou ouvir o livro do dia");
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.zero)),
                child: Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://dummyimage.com/600x400/eb00eb/fff'),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.3), BlendMode.multiply),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 8, bottom: 8, right: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 0, bottom: 20),
                    child: Column(
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text('categoria_nome',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "descricao",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Titulo(
                texto: 'Categorias',
              ),
              const SizedBox(
                height: 6,
              ),
              const Descricao(texto: "Categorias"),
              const SizedBox(
                height: 12,
              ),
              SizedBox(height: 200, child: builGridView()),
              const SizedBox(
                height: 12,
              ),
              const Titulo(texto: "Para você"),
              const SizedBox(
                height: 6,
              ),
              const Descricao(texto: "Audio books especiais para você"),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 240,
                //width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        //mainAxisExtent: 80,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1 / 1.5,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cardNovosNoApp(index);
                      }),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Titulo(texto: "Novidades Yeva"),
              const SizedBox(
                height: 6,
              ),
              const Descricao(
                  texto:
                      "Os audiolivros adicionados recentemente especialmente para você"),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 160,
                //width: MediaQuery.of(context).size.width,
                child: Container(
                  //margin: const EdgeInsets.only(right: 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        //mainAxisExtent: 80,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1 / 1,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cardNovosNoApp(index);
                      }),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Titulo(texto: "Playlist"),
              const SizedBox(
                height: 6,
              ),
              const Descricao(
                  texto: "As playlist mais ouvidas que combinam com você"),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 240,
                //width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 350,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(20),
                        // height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber),
                        child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 4,
                                child: Text(
                                  "X Livros disponiveis",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Teste $index",
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: -1),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text("Lorem Ipsum"),
                                    IconButton(
                                        onPressed: () {
                                          _showMessage("Abrir a playlist");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Player()));
                                        },
                                        icon: const Icon(
                                          Icons.play_circle_fill,
                                          size: 35,
                                        ))
                                  ],
                                ),
                              )
                            ]),
                      );
                    }),
              ),
            ],
          ),
        ),
        Positioned(
          //top: 0.0,
          left: 5.0,
          right: 5.0,
          bottom: 5.0,
          child: smallPlayer(),
        )
      ]),
    );
  }
}
