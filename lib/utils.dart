import 'package:collection/collection.dart';
List<bool> decision = [];


  getSuggestedImage() {
    //"Sad",
    //     "Colorful",
    //     "Modern",
    //     "Famous",
    //     "Landscape",

    //happy, not colorful, old, not well known, not landscape
    if (ListEquality().equals(decision,[false, false, false, false, false])) {
      return 'assets/oldMan.jpg';
    }
    //happy, not colorful, old, not well known, not landscape
    else if (ListEquality().equals(decision,[true, true, false, false, false])) {
      return 'assets/outer2.jpg';
    }
    //happy, colorful, old, not well known, not landscape
    else if (ListEquality().equals(decision,[true, true, true, false, false])) {
      return 'assets/image.jpg';
    }
    //happy, colorful, modern, not well known, not landscape
    else if (ListEquality().equals(decision,[true, true, true, false, false])) {
      return 'assets/happyPortrait.jpg';
    }
    //happy, colorful, modern, well known, not landscape
    else if (ListEquality().equals(decision,[true, true, true, true, false])) {
      return 'assets/modern.jpg';
    }
    //happy, colorful, modern, well known, landscape
    else if (ListEquality().equals(decision,[true, true, true, true, true])) {
      return 'assets/happyLandscape.jpg';
    } else {
      return 'assets/outer1.jpg';
    }
  }


