import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = "";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(
      child: Text(
        'Press coder',
      ),
      onPressed: () => {},
    ));
  }
}
