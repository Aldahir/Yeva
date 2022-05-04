import 'package:flutter/material.dart';
import 'package:yeva/Screens/Playlist/overview_playlist.dart';

class ListCard extends StatelessWidget {
  final List data;
  ListCard({Key? key, required this.data}) : super(key: key);

  _showMessage(BuildContext context, String message) {
    SnackBar snackbar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xff26ad26),
      content: Text(message, style: const TextStyle(color: Colors.white)),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        //itemCount: data.length,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var text = data[index]['descricao'];
          var descricao = text.replaceRange(120, text.length, '...');
          return TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PlaylistOverview(id: data[index]['id']))),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image:
                      NetworkImage('https://dummyimage.com/600x400/rb06eb/fff'),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 0, 0, 0.3), BlendMode.multiply),
                ),
              ),
              //margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 0, bottom: 20),
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(data[index]['titulo'],
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900)),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 235,
                          child: Text(
                            "$descricao",
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ),
                        IconButton(
                            onPressed: () =>
                                _showMessage(context, "Abrir a playlist"),
                            icon: const Icon(
                              Icons.play_circle_fill,
                              size: 45,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
