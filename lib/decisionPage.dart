import 'package:flutter/material.dart';

class Decision extends StatefulWidget {
  const Decision({Key? key}) : super(key: key);

  @override
  _DecisionState createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
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
              Column(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text()),
                  ElevatedButton(onPressed: () {}, child: Text())
                ],
              )
            ]
        ));
  }
}
