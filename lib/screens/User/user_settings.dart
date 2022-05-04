import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  //const UserSettings({ Key? key }) : super(key: key);
  @override
  State createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  double _onChanged = 0;

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
                          Slider(
                              thumbColor: const Color(0xff26a64d),
                              activeColor: const Color(0xff26a64d),
                              inactiveColor:
                                  const Color.fromARGB(255, 101, 231, 140),
                              value: _onChanged,
                              label: _onChanged.round().toString(),
                              max: 1,
                              min: 0,
                              divisions: 1,
                              onChanged: (double v) => {
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
