
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tttt/config/constants.dart';

class Request {
  String id;
  String departmentID;
  String deviceID;
  String engineerID;
  Timestamp timestamp;
  String senderID;
  String response;
  String message;
  String state;
  String deviceName;
  String departmentName;



  Request({
    this.id= '',
    this.deviceID="",
    this.departmentID="",
    this.message="",
    this.response="0",
    this.engineerID="",
    this.senderID="",
    this.state="",
    this.timestamp,
    this.deviceName,
    this.departmentName,
  });


  Request.fromSnap(QueryDocumentSnapshot snap){
    Map data =snap.data();
    this.id= snap.id;
    this.departmentID = data["department_id"] ?? "";
    this.deviceID = data["device_id"]??"";
    this.deviceID = data["device_id"]??"";
    this.engineerID = data["engineer_id"]??"";
    this.message = data["message"] !=null ? data["message"].isNotEmpty ?data["message"]:"There is a problem":"There is a problem";
    this.response = data["response"] !=null ? data["response"].isNotEmpty ?data["response"]:"0":"0";
    this.senderID = data["sender_id"]??"";
    this.state = data["state"] !=null ? data["state"].isNotEmpty ? status.containsKey(data["state"])?data["state"]:"0":"0":"0";
    this.timestamp = data["timestamp"]??Timestamp.now();
    this.deviceName = data["device_name"] !=null ? data["device_name"].isNotEmpty ?data["device_name"]:"UNKNOWN":"UNKNOWN";
    this.departmentName = data["department_name"] !=null ? data["department_name"].isNotEmpty ?data["department_name"]:"UNKNOWN":"UNKNOWN";

  }
}
