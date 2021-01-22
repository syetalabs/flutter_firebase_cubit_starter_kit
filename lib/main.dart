import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/auth/auth_cubit.dart';
import 'data/repositories/auth_repository.dart';
import 'util/custom_routes.dart';
import 'views/pages/first_page/index.dart';
import 'views/pages/onboarding/kit_b.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(FirebaseAuthRepository()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: OnboardKitB(), 2: OnboardKitB()};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Cubit Starter Kit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CustomSplash(
        imagePath: 'assets/sk.png',
        backGroundColor: Colors.white,
        // backGroundColor: Color(0xfffc6042),
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: OnboardKitB(),
        customFunction: duringSplash,
        duration: 2500,
        type: CustomSplashType.StaticDuration,
        outputAndHome: op,
      ),
      routes: customRoutes,
    );
  }
}
