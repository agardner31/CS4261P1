List<bool> decision = [];


  getSuggestedImage() {
    //"Sad",
    //     "Colorful",
    //     "Modern",
    //     "Famous",
    //     "Landscape",

    //happy, not colorful, old, not well known, not landscape
    if (decision == [false, false, false, false, false]) {
      return 'oldMan.jpg';
    }
    //happy, not colorful, old, not well known, not landscape
    else if (decision == [true, false, false, false, false]) {
      return 'outer2.jpg';
    }
    //happy, colorful, old, not well known, not landscape
    else if (decision == [true, true, false, false, false]) {
      return 'image.jpg';
    }
    //happy, colorful, modern, not well known, not landscape
    else if (decision == [true, true, true, false, false]) {
      return 'happyPortrait.jpg';
    }
    //happy, colorful, modern, well known, not landscape
    else if (decision == [true, true, true, true, false]) {
      return 'modern.jpg';
    }
    //happy, colorful, modern, well known, landscape
    else if (decision == [true, true, true, true, true]) {
      return 'happyLandscape.jpg';
    } else {
      return 'outer1.jpg';
    }
  }
