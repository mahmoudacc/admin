

import 'package:url_launcher/url_launcher.dart';

String phoneNumber = "+201120199909";
String messengerURL = "m.me/mahmoud.mustafa110";
String telegramUrl = "ClinicalHospitalSystem1";//Done

class ContactHelper{
  static whatsAppLauncher()async{
    var whatsAppUrl ="whatsapp://send?phone=$phoneNumber";
    // await canLaunch(whatsappUrl)?
    await launch(whatsAppUrl);
    //     :
    // print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
  static messengerLauncher()async{
    var _messengerUrl ="http://$messengerURL";
    // await canLaunch(_messengerUrl)?
    await launch(_messengerUrl);
    //     :
    // print("open messanger app link or do a snackbar with notification that there is no whatsapp installed");
  }

  static phoneCallLauncher()async{
    String _phoneCall = "tel:$phoneNumber";
    //bool _canLunch = await canLaunch(_phoneCall);
    // if(await canLaunch(_phoneCall)){
    //print(_canLunch);
    await launch(_phoneCall);
    // }else{
    //   print("open phone call app link or do a snackbar with notification that there is no whatsapp installed");
    // }
  }

  static telegramLauncher()async{
    var _telegramUrl ="https://t.me/$telegramUrl";
    // await canLaunch(_messengerUrl)?
    await launch(_telegramUrl);
    //     :
    // print("open messanger app link or do a snackbar with notification that there is no whatsapp installed");
  }


}