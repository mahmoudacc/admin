import 'package:flutter/material.dart';
import 'package:tttt/component/drawer.dart';
import 'package:tttt/component/fab/custom_fab.dart';

//import'./pages/contant.dart';
class Contact extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: CustomFAB(),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'images/1 (2).jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.teal,
                  size: 40.0,
                ),
                SizedBox(width: 80.0,),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('MOBILE',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.teal)),
                      Text('+20 112 019 9909',
                          style: TextStyle(fontSize: 15.0)),
                      Text('+20 120 189 0118',
                          style: TextStyle(fontSize: 15.0)),
                      Text('+20 115 508 3475',
                          style: TextStyle(fontSize: 15.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.teal,
                  size: 40.0,
                ),
                SizedBox(
                  width: 80.0,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('Email',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.teal)),
                      Text('clicicaldepartment.hospital@gmail.com',
                         ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.wb_cloudy_outlined,
                  color: Colors.teal,
                  size: 40.0,
                ),
                SizedBox(
                  width: 80.0,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('WHATSAPP',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.teal)),
                      Text('https://chat.whatsapp.com/JTuprOJTnDD4gb3Bqf90Mn',
                          style: TextStyle(fontSize: 13)),


                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
