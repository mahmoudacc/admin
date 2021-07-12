
import 'package:cloud_firestore/cloud_firestore.dart';

class Device{
  String id;
  String name;
  String image;
  String manual;
  String qr;

  Device.fromSnap(Map snap) {

      this.id= snap['id'] ?? "";
      this.name= snap["name"] ?? "";
      this.manual= snap["manual"] ?? "";
      this.qr = snap['qr']??"";
      this.image= snap["image"] ?? "https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png";
      // date: snap.value["date"] != null
      //     ? DateTime.parse(snap.value["date"]) ?? DateTime.now()
      //     : DateTime.now(),
  }

  convertToMap(Device data){
    return {
      "id":data.id ?? "",
      "name":data.name ?? "",
      "manual":data.manual ?? "",
      "qr":data.qr ?? "",
      "image":data.image ?? "",
    };
  }

  Device({this.id, this.name, this.image,this.manual,this.qr});
}