
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tttt/component/drawer.dart';
import 'package:tttt/component/request_card.dart';
import 'package:tttt/modules/reqest.dart';

class MyRequests extends StatelessWidget {
  List<Request> myRequests = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Requests"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('requests')
              .where('sender_id',
                  isEqualTo: FirebaseAuth.instance.currentUser.uid)
              .orderBy("timestamp", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('please try again later'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            myRequests = [];
            snapshot.data.docs.forEach((element) {
              if (element.exists) {
                myRequests.add(Request.fromSnap(element));
              }
            });
            return myRequests.isEmpty?Center(
              child: Text("No requests"),
            ):Container(
              height: double.maxFinite,
              width: double.maxFinite,
              margin: EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Theme.of(context).accentColor,
                          ),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "NO. OF Records :",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1.copyWith(color: Colors.white),
                              ),
                              SizedBox(width: 40.0,),
                              Text(
                                "${myRequests.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView.builder(itemCount: myRequests.length,itemBuilder: (context,index)=>RequestCard(request: myRequests[index])),
                    )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
