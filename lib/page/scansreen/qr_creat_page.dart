
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tttt/controlles/department_controller.dart';
import 'package:tttt/modules/department.dart';

class QRCreatePage extends StatefulWidget {
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final scaffoldKey =GlobalKey<ScaffoldState>();
  String data = " ";

  String _selectedDepartmentID ;
  String _selectedDeviceID;

  IconData icon = Icons.refresh;
  @override
  void dispose() {
    super.dispose();
  }

  submitData(DepartmentController controller) async{
    if(_selectedDepartmentID!=null&&_selectedDeviceID!=null){
      scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
        data =
        '${_selectedDepartmentID.trim()} ${_selectedDeviceID.trim()}' ??
        'Hello world';
        icon = Icons.done;
      });
      controller.setQRCode(qr: data, departmentID: _selectedDepartmentID, deviceID: _selectedDeviceID);
    }else{
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("please select department and device")));
    }


  }

  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
        appBar: AppBar(
            title: Text("Select Device From The List"),
            ),
        body: Consumer<DepartmentController>(
            builder: (context, departmentData, child) =>
                departmentData.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: SingleChildScrollView(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BarcodeWidget(
                                  barcode: Barcode.qrCode(),
                                  color: Colors.black,
                                  data: data,
                                  width: 200,
                                  height: 200,
                                ),
                                SizedBox(height: 40),
                                departmentData.departments.isNotEmpty
                                    ? DropdownButton(
                                  hint:  Text("Select Department"),
                                  isExpanded: true,
                                  items: departmentData.departments.map((e) =>
                                    DropdownMenuItem(child: Text(e.name),value: e.id,)).toList(),
                                  onChanged:(val)=>setState(() {
                                    _selectedDepartmentID=val;
                                    _selectedDeviceID=null;
                                    // print(val);
                                  }),
                                  onTap: (){
                                    setState(() {
                                      icon = Icons.refresh;
                                      scaffoldKey.currentState.hideCurrentSnackBar();
                                    });

                                  },
                                  value: _selectedDepartmentID,
                                )
                                    : Container(),
                                SizedBox(height: 20),
                                if(_selectedDepartmentID!=null)
                                  departmentData.departments.firstWhere((element) => element.id==_selectedDepartmentID).devices.isNotEmpty
                                    ? DropdownButton(
                                  hint: new Text("Select Device"),
                                  isExpanded: true,
                                  items: departmentData.departments.firstWhere((element) => element.id==_selectedDepartmentID).devices.map((e) =>
                                      DropdownMenuItem(child: Text(e.name),value: e.id,)).toList(),
                                  onChanged:(val)=>setState(() {

                                    _selectedDeviceID=val;
                                    // print(val);
                                  }),
                                  onTap: (){
                                    setState(() {
                                      icon = Icons.refresh;
                                      scaffoldKey.currentState.hideCurrentSnackBar();
                                    });
                                  },
                                  value: _selectedDeviceID,
                                )
                                    : Container(),
                                SizedBox(height: 40),
                                Center(
                                  child:FloatingActionButton(
                                    backgroundColor:
                                    Theme.of(context).primaryColor,
                                    child: Icon(icon, size: 30),
                                    onPressed: ()=>submitData(departmentData),
                                  ),
                                ),
                                // Row(
                                //   children: [
                                    // Expanded(
                                    //   child: buildTextField(context,
                                    //       controller: deviceIDController,
                                    //       title: "Device ID"),
                                    // ),
                                //     const SizedBox(width: 12),
                                //     FloatingActionButton(
                                //       backgroundColor:
                                //           Theme.of(context).primaryColor,
                                //       child: Icon(Icons.done, size: 30),
                                //       onPressed: submitData,
                                //     ),
                                //   ],
                                // ),
                              ],
                            )),
                      )),
      );

  Widget buildTextField(BuildContext context,
          {@required TextEditingController controller,
          @required String title}) =>
      TextFormField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: TextStyle(color: Colors.grey),
          labelText: title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        validator: (text) {
          if (text.isEmpty) {
            return "Cannot be empty";
          } else if (text.trim().contains(" ")) {
            return "Cannot contain spaces";
          } else if (text.contains("-")) {
            return "Cannot contain - ";
          } else {
            return null;
          }
        },
      );
}
