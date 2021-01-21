import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/auth_entry_screen.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/flutter_login.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/kit_a.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/kit_a.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/kit_b.dart';
import '../views/pages/app_config/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/forget_password.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/data_curd/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/firebase_cloud/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/first_page/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/image_upload/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/log_analy_crash/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/theme/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/custom_user_data.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/user_account_data.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/version/index.dart';

import '../views/pages/auth/home/index.dart';
import '../views/pages/auth/login.dart';
import '../views/pages/auth/register.dart';
import '../views/pages/dashboard/index.dart';

import '../views/pages/user/index.dart';
import '../views/pages/user/user_core_data.dart';
import '../views/pages/user/user_account_data.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => FirstPage(),
  Dashboard.routeName: (context) => Dashboard(),
  UserScreen.routeName: (context) => UserScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Home.routeName: (context) => Home(),
  UserCoreData.routeName: (context) => UserCoreData(),
  UserAccountData.routeName: (context) => UserAccountData(),
  CustomUserData.routeName: (context) => CustomUserData(),
  ThemeScreen.routeName: (context) => ThemeScreen(),
  DataCurdScreen.routeName: (context) => DataCurdScreen(),
  AppConfigScreen.routeName: (context) => AppConfigScreen(),
  LogAnalyCrashScreen.routeName: (context) => LogAnalyCrashScreen(),
  FirebaseCloudScreen.routeName: (context) => FirebaseCloudScreen(),
  ImageUploadScreen.routeName: (context) => ImageUploadScreen(),
  VersionScreen.routeName: (context) => VersionScreen(),
  ForgetPassword.routeName: (context) => ForgetPassword(),
  OnboardingMainScreen.routeName: (context) => OnboardingMainScreen(),
  OnboardKitA.routeName: (context) => OnboardKitA(),
  OnboardKitB.routeName: (context) => OnboardKitB(),
  FlutterLoginScreen.routeName: (context) => FlutterLoginScreen(),
  AuthEntryScreen.routeName: (context) => AuthEntryScreen(),
  AuthKitA.routeName: (context) => AuthKitA(),
  AuthMainScreen.routeName: (context) => AuthMainScreen(),
};
