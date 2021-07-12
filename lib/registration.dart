import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:tttt/page/Task_Home.dart';

class Registration extends StatefulWidget {
  static const String id = "Registration";

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;
  final FirebaseAuth_auth = FirebaseAuth.instance;

  Key get key => null;

  Future<void> registerUser() async {
    UserCredential userCredential =
        await FirebaseAuth_auth.createUserWithEmailAndPassword(
                email: email, password: password)
            .onError((error, stackTrace) {
      print('createUserWithEmailAndPassword Error: $error');
      return null;
    });

    if (userCredential?.user != null) {
      Navigator.pushNamed(context, Tasthome.id);
    }

    /*context,MaterialPageRoute(
      //builder: (context) => Tasthome.id
      Navigator.pushNamed(context, Tasthome.id);
      */
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
                child: Image.asset("images/logo.png"),
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
            await registerUser();
          }, "Regestrstion"),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

/*
        SizedBox(
          height: 50,
        ),
        CustomButton(() {
          Navigator.of(context).pushNamed(Login.id);
        }, 'Login'),
        SizedBox(
          height: 10,
        ),
        CustomButton(() {
          Navigator.of(context).pushNamed(Registration.id);
        }, 'Register')
       */
