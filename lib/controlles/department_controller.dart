import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tttt/config/constants.dart';
import 'package:tttt/modules/department.dart';
import 'package:tttt/modules/device.dart';

class DepartmentController extends ChangeNotifier {
  List<Department> departments = [];
  Department selectedDepartment;
  String note = "";
  bool isLoading = false;
  bool requestLoading = false;

  getDepartments() async {
    isLoading = true;
    notifyListeners();
    departments = [];

    await FirebaseFirestore.instance
        .collection("department")
        .get()
        .then((data) {
      data.docs.forEach((element) {
        // print(element.id);
        if (element.exists) {
          departments.add(Department.fromSnap(element));
        }
      });
    });

    // print(departments[0].devices[0].name);
    isLoading = false;
    notifyListeners();
    // .snapshots()
    //     .listen((data) {
    //   data.docs.forEach((element) {
    //     // print(element.id);
    //
    //   });
    // });
  }

  setQRCode(
      {@required String qr,
      @required String departmentID,
      @required String deviceID}) async {
    // print(departments);
    List<Map> data = [];
    List<Device> _devices =
        departments.firstWhere((element) => element.id == departmentID).devices;

    _devices.firstWhere((element) => element.id == deviceID).qr = qr;
    // print(_devices);

    _devices.forEach((element) {
      data.add(Device().convertToMap(element));
    });
    // print(data);
    await FirebaseFirestore.instance
        .collection('department')
        .doc(departmentID)
        .update({'devices': data});
  }


  Future<bool> sendRequest() async {
    requestLoading = true;
    notifyListeners();
    // print(FirebaseAuth.instance.currentUser.uid);
    try {
      await FirebaseFirestore.instance.collection('requests').add({
        'department_id': selectedDepartment.id,
        "device_id": selectedDepartment.devices[0].id,
        "engineer_id": "",
        "message": note,
        "sender_id": FirebaseAuth.instance.currentUser.uid,
        "state": "0",
        "timestamp": Timestamp.now(),
        "response": "0",
        "device_name": selectedDepartment.devices[0].name,
        "department_name":selectedDepartment.name,
      });
    } catch (e) {
      print(e);
      requestLoading = false;
      notifyListeners();
      return false;
    }

    selectedDepartment = Department.empty();
    note = "";
    requestLoading = false;
    notifyListeners();
    return true;
  }

  scanQrResult(String qr) async {
    if (qr.contains(' ')) {
      if (departments.isEmpty) await getDepartments();
      String departmentID = qr.split(' ')[0];
      String deviceID = qr.split(' ')[1];
      selectedDepartment =
          departments.firstWhere((element) => element.id == departmentID);
      selectedDepartment.devices = selectedDepartment.devices
          .where((element) => element.id == deviceID)
          .toList();
      // print(selectedDepartment.devices[0].name);
    } else {
      selectedDepartment = Department.empty();
    }
    notifyListeners();
  }

  setNote(String message) {
    note = message;
    notifyListeners();
  }



  @override
  void dispose() {
    super.dispose();

  }
}
