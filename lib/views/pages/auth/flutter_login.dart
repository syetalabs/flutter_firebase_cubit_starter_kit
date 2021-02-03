import 'package:flutter/material.dart';
import 'home/index.dart';
import 'package:flutter_login/flutter_login.dart';

class FlutterLoginScreen extends StatelessWidget {
  static const routeName = '/flutter-login-screen';
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Login',
      logo: 'assets/av1.png',
      onLogin: null,
      onSignup: null,
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacementNamed(context, Home.routeName);
      },
      onRecoverPassword: null,
    );
  }
}
