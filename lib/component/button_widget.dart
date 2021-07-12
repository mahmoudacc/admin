import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          shape: StadiumBorder(),
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textColor: Colors.white,
          onPressed: onClicked,
        ),
  );
}
