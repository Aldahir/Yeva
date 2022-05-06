import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  //const UserSettings({ Key? key }) : super(key: key);
  @override
  State createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  bool _onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          foregroundColor: const Color(0xff26ad64),
        ),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: [
              const Text("Texto1"),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(5.0),
                //color: Colors.amber,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 2.0,
                        offset: Offset(0.0, 1.0),
                        spreadRadius: 0.0,
                        color: Color.fromARGB(20, 0, 0, 0))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Menu de definições"),
                          Switch(
                              activeColor: const Color(0xff26a64d),
                              value: _onChanged,
                              onChanged: (v) => {
                                    setState(() {
                                      _onChanged = v;
                                    })
                                  })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ));
  }
}
