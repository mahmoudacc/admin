import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tttt/component/drawer.dart';
import 'dart:ui';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:tttt/component/fab/custom_fab.dart';
import 'package:tttt/controlles/department_controller.dart';
import 'package:tttt/page/scansreen/qr_creat_page.dart';
import 'package:tttt/page/scansreen/qr_scan_page.dart';
import 'package:tttt/component/button_widget.dart';

class Tasthome extends StatefulWidget {
  static const String id = 'tast_home';

  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Tasthome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "hospital system",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.teal,
          // actions: <Widget>[
          //   IconButton(
          //       icon: Icon(Icons.search),
          //       onPressed: () {
          //         showSearch(context: context, delegate: DataSearch());
          //       })
          // ],
          centerTitle: true,
          elevation: 20,
          //leading:IconButton(icon: Icon(Icons.access_alarm), onPressed: (){}),
          //titleSpacing: 100,
          // brightness: Brightness.dark,
          //primary: false,
        ),
        floatingActionButton: CustomFAB(),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: true,
                animationDuration: Duration(milliseconds: 750),
                dotSize: 10,
                dotIncreaseSize: 2,
                dotSpacing: 15,
                dotColor: Colors.teal,
                dotIncreasedColor: Colors.red,
                dotBgColor: Colors.white.withOpacity(0),
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 0,

                //overlayShadow: true,
                //overlayShadowColors: Colors.black26,
                //showIndicator: true,
                indicatorBgPadding: 0,
                images: [
                  AssetImage('images/3.jpg'),
                  AssetImage('images/2 .jpg'),
                  AssetImage('images/1 (2).jpg'),
                  AssetImage('images/4.jpg'),
                ],
                borderRadius: true,
                //radius:Radius.circular(20),
              ),
            ),
            Container(
              height: 20,
              width: double.infinity,
            ),

///////////////////////////////////////////////////////////////
            Container(
                height: 80,
                child: ListTile(
                  title: Text(
                    "QR Scan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.camera,
                    color: Colors.teal,
                    size: 50,
                  ),
                  //trailing: Icon(Icons.hot_tub),
                  //subtitle: Text("mmnn"),
                  //isThreeLine: true,
                  dense: true,
                  onLongPress: () {
                    print("long press");
                  },
                  onTap: () {
                    Navigator.of(context).pushNamed('scan');
                  },
                )),
            SizedBox(height: 0),
            Container(
              //padding:EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'last updates on engineering department',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              children: <Widget>[
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/baby.jpg'),
                    footer: Container(
                      color: Colors.black,
                      child: Text(
                        'OHMEDA Ohio Care Plus Access Mod 4000 Neonatal incubator has been repaired',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/CT1.jpg'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Toshiba Medical’s New Celesteion PET/CT Improves Resolution, Reconstruction ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/monitor.jpg'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Philips-M3046A-M4-Patient-Monitor-w-Philips-M3000A(Broken Module Connector)',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/mayo clinic.jpg'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Problem in CT',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/mayo clinic.jpg'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Problem in CT',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/mayo clinic.jpg'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Problem in CT',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/mayo clinic.jpg'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Problem in CT',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/mayo clinic.jpg'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Problem in CT',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
                InkWell(
                  child: GridTile(
                    child: Image.asset('images/4228890.png'),
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'party with children ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    print("tap");
                  },
                ),
              ],
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    Provider.of<DepartmentController>(context,listen: false).getDepartments();
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //action for bar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //icon leading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //result
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when person search
    return Text("data");
  }
}
