import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/frame.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(80.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                getUserArtSuggestion(),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
      ]
    );
  }
}
