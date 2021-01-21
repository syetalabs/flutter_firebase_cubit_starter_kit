import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/register.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/widgets/feature_button.dart';

import 'login.dart';

class AuthEntryScreen extends StatelessWidget {
  static const routeName = '/auth-entry-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Entry'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
                heading: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                }),
            FeatureButton(
                heading: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
