import 'package:anna_app_p1/utils.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'displayArt.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'content.dart';

class Decision extends StatefulWidget {
  const Decision({Key? key}) : super(key: key);

  @override
  _DecisionState createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
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
                  onStackFinished: () {
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () {
              //           _matchEngine!.currentItem?.nope();
              //         },
              //         child: Text("Nope")),
              //     ElevatedButton(
              //         onPressed: () {
              //           _matchEngine!.currentItem?.superLike();
              //         },
              //         child: Text("Superlike")),
              //     ElevatedButton(
              //         onPressed: () {
              //           _matchEngine!.currentItem?.like();
              //         },
              //         child: Text("Like"))
              //   ],
              // )
            ])));



      // body: Stack(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             image: AssetImage(
      //               'assets/TheaterCurtains.jpg',
      //             ),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(160.0),
      //         child:
      //         ToggleButtons(
      //           isSelected: decisionArray,
      //           color:Colors.black,
      //           selectedColor: Colors.white,
      //           children: [
      //             ElevatedButton(onPressed: () {Navigator.of(context).push(
      //               MaterialPageRoute(
      //                 builder: (context) {
      //                   return Display();
      //                 },
      //               ),
      //             );}, child: Text('sad')),
      //             ElevatedButton(onPressed: () {Navigator.of(context).push(
      //               MaterialPageRoute(
      //                 builder: (context) {
      //                   return Display();
      //                 },
      //               ),
      //             );}, child: Text('happy'))
      //           ],
      //         ),
      //       )
      //     ]
      // )
  }
}
