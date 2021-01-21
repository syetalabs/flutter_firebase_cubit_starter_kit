import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/auth_entry_screen.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/forget_password.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/login.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/register.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/widgets/feature_button.dart';

class AuthKitA extends StatelessWidget {
  static const routeName = '/Auth-kit-a-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Kit A'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
              heading: "1-Entry",
              onPressed: () {
                Navigator.pushNamed(context, AuthEntryScreen.routeName);
              },
            ),
            FeatureButton(
              heading: "2-SignUp",
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
            ),
            FeatureButton(
              heading: "3-Login",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            FeatureButton(
              heading: "4-Forget Password",
              onPressed: () {
                Navigator.pushNamed(context, ForgetPassword.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
