import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
//import 'package:tttt/chat.dart';
import 'package:tttt/component/button_widget.dart';
import 'package:tttt/component/note_MBS.dart';
import 'package:tttt/config/constants.dart';
import 'package:tttt/controlles/department_controller.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = '';
  bool done = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String state ='';

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            //title: Text(MyApp.title),
            ),
        body: Consumer<DepartmentController>(
          builder: (context, departmentController, child) => Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (qrCode.isNotEmpty)
                      Text(
                        'Scan Result',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    SizedBox(height: 8),
                    if (qrCode.isNotEmpty)
                      if (departmentController.selectedDepartment.id.isNotEmpty)
                        Center(
                            child: Image.network(
                          departmentController
                              .selectedDepartment.devices[0].image,
                          fit: BoxFit.scaleDown,
                          width: 2000,
                          height: 200,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        )),
                    SizedBox(height: 8),
                    if (qrCode.isNotEmpty)
                      ListTile(
                        title: Text("QR Code"),
                        trailing: Text(
                          '$qrCode',
                        ),
                      ),
                    if (qrCode.isNotEmpty) SizedBox(height: 8),
                    if (qrCode.isNotEmpty)
                      if (departmentController.selectedDepartment.id.isNotEmpty)
                        ListTile(
                          title: Text("Department"),
                          trailing: Text(
                            '${departmentController.selectedDepartment.name}',
                          ),
                        ),
                    SizedBox(height: 8),
                    if (qrCode.isNotEmpty)
                      if (departmentController.selectedDepartment.id.isNotEmpty)
                        ListTile(
                          title: Text("Device"),
                          trailing: Text(
                            '${departmentController.selectedDepartment.devices[0].name}',
                          ),
                        ),
                    SizedBox(height: 8),
                    if (qrCode.isNotEmpty)
                      if (departmentController.selectedDepartment.id.isNotEmpty)
                        if (departmentController.note.isNotEmpty)
                          ListTile(
                            title: Text("Note"),
                            trailing: Text(
                              '${departmentController.note}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                    if (qrCode.isNotEmpty)
                      if (departmentController.selectedDepartment.id.isNotEmpty)
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('requests')
                                .where('department_id', isEqualTo: departmentController.selectedDepartment.id)
                                .where('device_id', isEqualTo: departmentController.selectedDepartment.devices[0].id)
                                .orderBy("timestamp", descending: true)
                                .snapshots(),
                            builder: (context, snapshot){
                              if (snapshot.hasError) {
                                return Container();
                              }

                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if(snapshot.data.docs.isNotEmpty) {
                                var data = snapshot.data.docs.first;
                                state = data["state"] != null
                                    ? data["state"].isNotEmpty ? status
                                    .containsKey(data["state"])
                                    ? data["state"]
                                    : "0" : "0"
                                    : "0";
                                print(state);
                                return ListTile(
                                  title: Text("Current state"),
                                  trailing: Text(
                                    '${convertStateCodeToTitle(state)}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }else{
                                return Container();
                              }
                            }),
                    SizedBox(height: 40.0),
                    if (qrCode.isNotEmpty)
                      if (departmentController.selectedDepartment.id.isNotEmpty)
                        departmentController.requestLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ButtonWidget(
                                text: 'Send your complaint',
                                onClicked: () async {
                                  done =
                                      await departmentController.sendRequest();
                                  setState(() {
                                    if (done) {
                                      qrCode = '';
                                      Future.delayed(Duration(seconds: 2));
                                      scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text("DONE"),
                                        duration: Duration(seconds: 2),
                                      ));
                                    } else {
                                      Future.delayed(Duration(seconds: 2));
                                      scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "There is a problem please try again later"),
                                        duration: Duration(seconds: 2),
                                      ));
                                    }
                                  });
                                },
                              ),

                    SizedBox(
                      height: 20.0,
                    ),
                    if (qrCode.isNotEmpty)
                      if (departmentController.selectedDepartment.id.isNotEmpty)
                        if (!departmentController.requestLoading)
                          ButtonWidget(
                            text: 'Device problems',
                            onClicked: () => commentMBS(context),
                          ),
                    SizedBox(height: 20),
                    if (!departmentController.requestLoading)
                      qrCode.isNotEmpty
                          ? ButtonWidget(
                              text: departmentController
                                      .selectedDepartment.id.isNotEmpty
                                  ? 'scan another QR'
                                  : 'Start QR scan',
                              onClicked: () => scanQRCode(departmentController),
                            )
                          : ButtonWidget(
                              text: 'Start QR scan',
                              onClicked: () => scanQRCode(departmentController),
                            ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  static convertStateCodeToTitle(String code){
    return status.containsKey(code)?status[code]:"UNKNOWN";
  }

  Future<void> scanQRCode(DepartmentController departmentController) async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
        departmentController.scanQrResult(qrCode);
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }

  prob() {}
}
