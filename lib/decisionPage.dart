import 'package:anna_app_p1/utils.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'database.dart';
import 'displayArt.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'content.dart';


class Decision extends StatefulWidget {
  //const Decision({Key? key}) : super(key: key);
  final String uid;
  Decision({required this.uid});

  @override
  _DecisionState createState() => _DecisionState(uid: uid);
}

class _DecisionState extends State<Decision> {
  final String uid;
  _DecisionState({required this.uid});
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Sad",
    "Colorful",
    "Modern",
    "Famous",
    "Landscape",
  ];
  List<Color> _colors = [
    Colors.black,
    Colors.pink,
    Colors.white,
    Colors.red,
    Colors.green,
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            decision.add(true);
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            decision.add(false);
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          // superlikeAction: () {
          //   _scaffoldKey.currentState?.showSnackBar(SnackBar(
          //     content: Text("Superliked ${_names[i]}"),
          //     duration: Duration(milliseconds: 500),
          //   ));
          // },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(children: [
              Container(
                //height: MediaQuery.of(context).size.height - kToolbarHeight,
                child: SwipeCards(
                  matchEngine: _matchEngine!,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: _swipeItems[index].content.color,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Neon(
                            text: _swipeItems[index].content.text,
                            color: Colors.blue,
                            fontSize: 40,
                            font: NeonFont.Membra,
                            flickeringText: true,
                            glowingDuration: const Duration(milliseconds: 150),
                            //flickeringLetters: [0,1,4],
                          ),
                          Neon(
                            text: '<-----no       yes----->',
                            color: Colors.blue,
                            fontSize: 25,
                            font: NeonFont.Membra,
                            flickeringText: false,
                            //glowingDuration: const Duration(milliseconds: 150),
                            //flickeringLetters: [0,1,4],
                          ),
                        ],
                      ),
                    );
                  },
                  onStackFinished: () async {
                    await DatabaseService(uid: uid).updateUserData(decision);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Display();
                        },
                      ),
                    );
                  },
                  itemChanged: (SwipeItem item, int index) {
                    print("item: ${item.content.text}, index: $index");
                  },
                  //upSwipeAllowed: true,
                  fillSpace: true,
                ),
              ),
            ])));
  }
}
