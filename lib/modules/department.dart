
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tttt/modules/device.dart';

class Department{
  String id;
  String name;
  String imageUrl;
  List<Device> devices=[];


  Department.empty(){
    this.id="";
    this.name="";
    this.imageUrl="";
    this.devices=[];
  }

 Department.fromSnap(QueryDocumentSnapshot snap){
   Map data =snap.data();
     this.id= snap.id ?? "";
     this.name= data["name"] ?? "";
     this.imageUrl = data["image"] ?? "https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png";
   data["devices"] != null ? data["devices"].forEach((element) {
       this.devices.add(Device.fromSnap(element));
     }) : [];
     // date: snap.value["date"] != null
     //     ? DateTime.parse(snap.value["date"]) ?? DateTime.now()
     //     : DateTime.now(),
 }

   Department({this.id, this.name, this.imageUrl,this.devices});

}