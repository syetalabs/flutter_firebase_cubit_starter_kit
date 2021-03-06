import 'package:flutter/material.dart';

import '../views/pages/auth/auth_entry_screen.dart';
import '../views/pages/auth/flutter_login.dart';
import '../views/pages/auth/index.dart';
import '../views/pages/auth/kit_a.dart';
import '../views/pages/onboarding/index.dart';
import '../views/pages/onboarding/kit_a.dart';
import '../views/pages/onboarding/kit_b.dart';
import '../views/pages/onboarding/kit_c.dart';
import '../views/pages/app_config/index.dart';
import '../views/pages/auth/forget_password.dart';
import '../views/pages/data_curd/index.dart';
import '../views/pages/firebase_cloud/index.dart';
import '../views/pages/image_upload/index.dart';
import '../views/pages/log_analy_crash/index.dart';
import '../views/pages/theme/index.dart';
import '../views/pages/user/custom_user_data.dart';
import '../views/pages/user/user_account_data.dart';
import '../views/pages/version/index.dart';
import '../views/pages/auth/home/index.dart';
import '../views/pages/auth/login.dart';
import '../views/pages/auth/register.dart';
import '../views/pages/dashboard/index.dart';
import '../views/pages/user/index.dart';
import '../views/pages/user/user_core_data.dart';

var customRoutes = <String, WidgetBuilder>{
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
  OnboardKitC.routeName: (context) => OnboardKitC(),
  FlutterLoginScreen.routeName: (context) => FlutterLoginScreen(),
  AuthEntryScreen.routeName: (context) => AuthEntryScreen(),
  AuthKitA.routeName: (context) => AuthKitA(),
  AuthMainScreen.routeName: (context) => AuthMainScreen(),
};
