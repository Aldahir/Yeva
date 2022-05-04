import 'package:flutter/material.dart';

class PlaylistOverview extends StatefulWidget {
  late int id;
  PlaylistOverview({Key? key, required this.id}) : super(key: key);

  @override
  State<PlaylistOverview> createState() => _PlaylistOverviewState();
}

class _PlaylistOverviewState extends State<PlaylistOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Center(
          child: Text(
            widget.id.toString(),
            style: const TextStyle(fontSize: 25, color: Colors.red),
          ),
        ));
  }
}
