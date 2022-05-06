import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(
            children: [
            Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    // alignment: Alignment.centerLeft,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.expand_more_rounded,
                      textDirection: TextDirection.rtl,
                      color: Colors.white,
                    ),
                  ),
                )),
            Expanded(
              flex: 0,
              child: IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: const Icon(
                  Icons.garage_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
                flex: 0,
                child: IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ))
          ]),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: const NetworkImage(
                    "https://dummyimage.com/1200x1200/d920d9/ffffff.jpg",
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.softLight),
                  fit: BoxFit.cover),
              // gradient: const LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [Colors.red, Colors.black]),
              // backgroundBlendMode: BlendMode.overlay
            ),
            width: 350,
            height: 350,
            child: const Text(""),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Vida e obra de Pi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "\u2022",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Aldair Cajicua",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Slider(
                  value: 0, activeColor: Colors.green, onChanged: (v) {})),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "00:05",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "10h:50",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white70,
                      size: 25,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.replay_30,
                      color: Colors.white70,
                      size: 35,
                    )),
                Container(
                  child: TextButton(
                      //splashRadius: 50,
                      //alignment: Alignment.center,
                      onPressed: () {},
                      //constraints: const BoxConstraints(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.play_circle_fill_outlined,
                          color: Colors.white,
                          size: 70,
                        ),
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.forward_30,
                      color: Colors.white70,
                      size: 35,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                      size: 25,
                    )),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text("1.00X",
                        style: TextStyle(
                          color: Colors.white70,
                        ))),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.toc,
                      color: Colors.white70,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.timer,
                      color: Colors.white70,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.crop_free,
                      color: Colors.white70,
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
