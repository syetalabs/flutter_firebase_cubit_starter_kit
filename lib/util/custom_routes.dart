import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/home/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/login.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/register.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/dashboard/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/user_core_data.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => WalkThrough(),
  Dashboard.routeName: (context) => Dashboard(),
  UserScreen.routeName: (context) => UserScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Home.routeName: (context) => Home(),
  UserCoreData.routeName: (context) => UserCoreData(),
};
