import 'package:provider/provider.dart';
import 'package:tttt/controlles/department_controller.dart';
import 'package:tttt/login.dart';
import 'package:tttt/page/Task_Home.dart';
import 'package:tttt/page/about.dart';
import 'package:tttt/page/contact.dart';
import 'package:tttt/page/qr_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'chat.dart';
import 'registration.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var id;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DepartmentController>(
            create: (context) => DepartmentController()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? MyHomepage.id
              : Tasthome.id,
          routes: {
            MyHomepage.id: (context) => MyHomepage(),
            Registration.id: (context) => Registration(),
            Login.id: (context) => Login(),
            Tasthome.id: (context) => Tasthome(),
            //Chat.id: (context) => Chat(),

            'login_screen': (context) {
              return Login();
            },
            'about': (context) {
              return About();
            },
            'homepage': (context) {
              return Tasthome();
            },
            'contact': (context) {
              return Contact();
            },
            'scan': (context) {
              return Scan();
            },
          }),
    );
  }
}

class MyHomepage extends StatelessWidget {
  static const String id = "Homescreen";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    width: 100.0,
                    child: Image.asset("images/logo.png",fit: BoxFit.scaleDown,),
                  ),
                ),
                Text(
                  'Clinical Hospital System',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: CustomButton(() {
            Navigator.of(context).pushNamed(Login.id);
          }, 'Login'),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: CustomButton(() {
            Navigator.of(context).pushNamed(Registration.id);
          }, 'Register'),
        )
      ],
    ));
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton(this.callback, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.teal,
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200,
          height: 45,
          child: Text(text),
        ),
      ),
    );
  }
}

/*
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Image.asset('lib/images/ab.gif'),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              CustomButton(() {
                Navigator.of(context).pushNamed(Login.id);
              }, 'Login'),
              SizedBox(
                height: 10,
              ),
              CustomButton(() {
                Navigator.of(context).pushNamed(Registration.id);
              }, 'Register'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset('lib/images/chat.jpg'),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/
