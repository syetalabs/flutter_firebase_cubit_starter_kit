import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/pages/dashboard/index.dart';
import 'views/pages/onboarding/kit_c.dart';
import 'cubits/auth/auth_cubit.dart';
import 'data/repositories/auth_repository.dart';
import 'util/custom_routes.dart';

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
  // Function duringSplash = (BuildContext context) {
  //   print('Inside during splash ');
  //   print('Something background process');
  //   final authCubit = BlocProvider.of<AuthCubit>(context);
  //   authCubit.isLoggedIn();

  //   if (authCubit.state is Authenticated) {
  //     print('Authenticated');
  //     return 1;
  //   } else {
  //     return 2;
  //   }
  // };

  final Map<int, Widget> op = {1: Dashboard(), 2: OnboardKitC()};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Cubit Starter Kit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: customRoutes,
      home: CustomSplash(
        imagePath: 'assets/sk.png',
        backGroundColor: Colors.white,
        // backGroundColor: Color(0xfffc6042),
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: OnboardKitC(),
        // customFunction: () {
        //   print('Inside Fucntion');
        //   duringSplash(context);
        // },
        customFunction: () {
          print('Inside during splash ');
          final authCubit = BlocProvider.of<AuthCubit>(context);
          authCubit.isLoggedIn();

          if (authCubit.state is Authenticated) {
            print('Authenticated');
            return 1;
          } else {
            return 2;
          }
        },
        duration: 2500,
        type: CustomSplashType.BackgroundProcess,
        outputAndHome: op,
      ),
    );
  }
}
