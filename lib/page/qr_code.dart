import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tttt/component/drawer.dart';
import 'package:tttt/component/fab/custom_fab.dart';
import 'package:tttt/page/scansreen/qr_creat_page.dart';
import 'package:tttt/page/scansreen/qr_scan_page.dart';
import 'package:tttt/component/button_widget.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  static final String title = 'QR Code Scanner';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: MyDrawer(),
        floatingActionButton: CustomFAB(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Scan QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRScanPage(),
                )),
              ),
              ButtonWidget(
                text: 'Creat QR code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => QRCreatePage())),
              ),
            ],
          ),
        ),
      );
}
