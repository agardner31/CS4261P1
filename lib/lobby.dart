import 'package:anna_app_p1/services/auth.dart';
import 'package:anna_app_p1/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LobbyScreen extends StatelessWidget {
  static const String id = 'help';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Lobby(),
    );
  }
}

class Lobby extends StatefulWidget {
  @override
  LobbySetup createState() => LobbySetup();
}

class LobbySetup extends State<Lobby> {
  int popUpNum = -1;
  int questionNum = 45;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/TheaterCurtains.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 70.00, horizontal: 50.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                    ),
                  ),
                  TextButton(onPressed: () async {
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('error signing in');
                    } else {
                      print('signed in');
                      print(result.uid);
                    }
                  },
                      child: Text('Enter Gallery')),
                ],
              ),
            ),
          ),
        ]
    ));
  }
}