import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neon/neon.dart';
import 'lobby.dart';
import 'package:flutter_sound/flutter_sound.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Gallery',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Virtual Gallery Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 0;
  FlutterSoundPlayer? _audioPlayer;

  Future _play() async {
    String audioAsset = "assets/knock.mp3";
    ByteData bytes = await rootBundle.load(audioAsset); //load sound from assets
    Uint8List soundBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    _audioPlayer = FlutterSoundPlayer();
    _audioPlayer!.openPlayer();
    _audioPlayer!.setVolume(200);
    await _audioPlayer!.startPlayer(
      fromDataBuffer: soundBytes,
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: new Stack(children: <Widget>[
      //background image placement

      GestureDetector(
        onTap: () async {
          _play();
          int now = DateTime.now().millisecondsSinceEpoch;
          if (now - lastTap < 1000) {
            print("Consecutive tap");
            consecutiveTaps++;
            print("taps = " + consecutiveTaps.toString());
          } else {
            if (consecutiveTaps >= 7) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Lobby();
                  },
                ),
              );
            }
            consecutiveTaps = 0;
          }
          lastTap = now;
        },
        child: Stack(children: [
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                  'assets/frontDoor.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Container(
              child: Neon(
                text: 'MetaGallery',
                color: Colors.cyan,
                fontSize: 50,
                font: NeonFont.Membra,
                flickeringText: true,
                glowingDuration: const Duration(milliseconds: 150),
                //flickeringLetters: [0,1,4],
              ),
            ),
          ),
        ]),
      ),
      //everything on top of background
    ]));
  }
}
