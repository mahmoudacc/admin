import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tttt/controlles/department_controller.dart';
import 'package:tttt/page/scansreen/qr_scan_page.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String note="no comment";
  @override
  Widget build(BuildContext context) {
    return Consumer<DepartmentController>(
      builder: (context, departmentController,child) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [

                    Container(height: 45.0,),
                    Container(height: 45.0,color: Colors.white,),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                          Text(
                            "Feel free to write what you want",
                            style: Theme.of(context).textTheme.caption,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          TextField(
                            minLines: 10,
                            maxLines: 10,
                            key: Key('note'),
                            // autofocus: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor:Colors.white ,
                              hoverColor: Colors.white,
                              filled: true,
                              hintText: "Device problem",
                              labelText: "Device problem",
                              hintStyle: Theme.of(context).textTheme.caption,
                              labelStyle: TextStyle(color: Colors.black26),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor,),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Theme.of(context).errorColor),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor,),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor,),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onChanged: (val)=>note = val??"no comment",
                            onSubmitted: (val) => note = val??"no comment",
                          ),
                        ],
                      ),
                    ),
                    Material(
                      // elevation: 20,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            InkWell(
                              child: Text(
                                'Cancel',
                                style: Theme.of(context).textTheme.title.copyWith(
                                  // fontSize: 18,
                                  decoration: TextDecoration.none),
                              ),
                                onTap:(){
                                Navigator.of(context).pop();
                                },
                            ),
                            Spacer(),
                            Container(
                              // width: MediaQuery.of(context).size.width,
                              // decoration: AuthHelper().buttonLinearGradient(context),
                              child: MaterialButton(
                                child: Text(
                                  "Done",
                                  style: Theme.of(context).textTheme.body1.copyWith(
                                    // fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                padding:
                                const EdgeInsets.only(right: 30,left: 30,top: 10,bottom: 10),
                                onPressed: (){
                                  departmentController.setNote(note??"There is a problem");
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),child: CircleAvatar(radius: 45.0,child: Center(child: Icon(Icons.history_edu,color: Colors.white,size: 50.0,),),backgroundColor: Colors.transparent,)),
              ),
            ],
          ),
        );
      }
    );
  }
}
