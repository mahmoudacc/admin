import 'package:flutter/material.dart';
import 'package:tttt/component/drawer.dart';
import 'package:tttt/component/fab/custom_fab.dart';

//import'./pages/contant.dart';
class About extends StatefulWidget {
  @override
  _AboutsState createState() => _AboutsState();
}

class _AboutsState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'About Us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        drawer: MyDrawer(),
        floatingActionButton: CustomFAB(),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  '4.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Container(
                  child: Text('clinical engineering department',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Text(
                      'Here in the Clinical Engineering Department, we repair and install devices',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'supervise the transfer of devices from one department to another',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
