import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/auth_entry_screen.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/flutter_login.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/kit_a.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/login.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/widgets/feature_button.dart';

class AuthMainScreen extends StatelessWidget {
  static const routeName = '/auth-main-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('SignUp/SignIn'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
                heading: "Auth System Kit A",
                onPressed: () {
                  Navigator.pushNamed(context, AuthKitA.routeName);
                }),
            FeatureButton(
                heading: "Auth System Kit B(flutter_login)",
                onPressed: () {
                  Navigator.pushNamed(context, FlutterLoginScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
