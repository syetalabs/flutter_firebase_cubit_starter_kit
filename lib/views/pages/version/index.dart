import 'package:flutter/material.dart';

class VersionScreen extends StatelessWidget {
  static const routeName = '/version-widget-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Version Widget'),
      ),
    );
  }
}
