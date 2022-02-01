import 'package:anna_app_p1/utils.dart';
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
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
        padding: const EdgeInsets.only(
            top: 155.0, bottom: 224.0, left: 61, right: 41),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                getSuggestedImage(),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]);
  }
}
