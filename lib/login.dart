import 'package:tttt/page/Task_Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'chat.dart';
import 'main.dart';

class Login extends StatefulWidget {
  static const String id = "Login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  final FirebaseAuth_auth = FirebaseAuth.instance;

  Key get key => null;

  Future<void> loginUser() async {
    UserCredential userCredential =
        await FirebaseAuth_auth.signInWithEmailAndPassword(
                email: email, password: password)
            .onError((error, stackTrace) {
      print('createUserWithEmailAndPassword Error: $error');
      return null;
    });

    if (userCredential?.user != null) {
      Navigator.pushNamed(context, Tasthome.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinical Hospital System"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                width: 120,
                child: Image.asset("images/logo.png",fit: BoxFit.scaleDown,),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  border: const OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              obscureText: true,
              onChanged: (value) => password = value,
              autocorrect: false,
              decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  border: const OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(() async {
            await loginUser();
          }, "Login"),
          SizedBox(height: 40.0,)
        ],
      ),
    );
  }
}
