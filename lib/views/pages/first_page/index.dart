import 'package:flutter/material.dart';
import '../dashboard/index.dart';

class FirstPage extends StatelessWidget {
  static const routeName = '/first-page-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RaisedButton(
        color: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, Dashboard.routeName);
        },
        child: Text(
          'Starter Kit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
