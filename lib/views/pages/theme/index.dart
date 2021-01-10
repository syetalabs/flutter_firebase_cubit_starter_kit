import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  static const routeName = '/theme-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Theme'),
      ),
    );
  }
}
