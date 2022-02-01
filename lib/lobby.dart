import 'package:anna_app_p1/services/auth.dart';
import 'package:anna_app_p1/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anna_app_p1/services/auth.dart';
import 'decisionPage.dart';

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
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          // image: DecorationImage(
          //   image: AssetImage(
          //     'assets/TheaterCurtains.jpg',
          //   ),
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
      Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 70.00, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'Email is required.' : null,
                  onChanged: (val) {
                    setState(() => username = val);
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Email',
                  ),
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter a password.' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter or Create New Password',
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            username, password);
                        if (result == null) {
                          print('error signing in');
                          setState(
                              () => error = 'Incorrect authentication values.');
                        } else {
                          print('signed in');
                          print(result.uid);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Decision();
                              },
                            ),
                          );
                        }
                      }
                    },
                    child: Text('Sign in')),
                Text(error),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(username, password);
                        if (result == null) {
                          print('error signing in');
                        } else {
                          print('signed in');
                          print(result.uid);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Decision();
                              },
                            ),
                          );
                        }
                      }
                    },
                    child: Text('Enter gallery as new visitor')),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
