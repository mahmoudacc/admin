
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tttt/helper/helper.dart';

class CustomFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      fabElevation: 2.0,
      alignment:
       Alignment.bottomRight,
      fabColor: Colors.black,
      fabOpenColor: Colors.black,
      fabOpenIcon: Icon(
        Icons.messenger_rounded,
        color: Colors.white,
      ),
      fabCloseIcon: Icon(
        Icons.close,
        color: Colors.white,
      ),
      fabCloseColor: Colors.black,
      ringColor: Colors.black.withOpacity(0.4),
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.phone,color: Colors.white,),
            onPressed: ContactHelper.phoneCallLauncher),
        IconButton(
            icon: Image.asset(
              "assets/images/telegram.png",
              fit: BoxFit.scaleDown,
              width: 24.0,
              height: 24.0,
            ),
            onPressed: ContactHelper.telegramLauncher),
        IconButton(
          icon: Image.asset(
            "assets/images/messenger.png",
            fit: BoxFit.scaleDown,
            width: 24.0,
            height: 24.0,
          ),
          onPressed:ContactHelper.messengerLauncher,
        ),
        IconButton(
            icon: Image.asset(
              "assets/images/whatsapp.png",
              fit: BoxFit.scaleDown,
              width: 24.0,
              height: 24.0,
            ),
            onPressed: ContactHelper.whatsAppLauncher),



      ],
    );
  }
}
