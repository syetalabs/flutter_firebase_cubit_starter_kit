import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/user_account_data.dart';

import '../views/pages/auth/home/index.dart';
import '../views/pages/auth/login.dart';
import '../views/pages/auth/register.dart';
import '../views/pages/dashboard/index.dart';
import '../views/pages/onboarding/index.dart';
import '../views/pages/user/index.dart';
import '../views/pages/user/user_core_data.dart';
import '../views/pages/user/user_account_data.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => WalkThrough(),
  Dashboard.routeName: (context) => Dashboard(),
  UserScreen.routeName: (context) => UserScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Home.routeName: (context) => Home(),
  UserCoreData.routeName: (context) => UserCoreData(),
  UserAccountData.routeName: (context) => UserAccountData(),
};
