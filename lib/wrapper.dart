import 'package:anna_app_p1/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anna_app_p1/displayArt.dart';

import 'lobby.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either their chosen art or the lobby page
    final user = Provider.of<User?>(context);

    if (user == null) {
      return Lobby();
    } else {
      return Display();
    }
  }

}
