import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_cubit_starter_kit/cubits/auth/auth_cubit.dart';
import 'package:flutter_firebase_cubit_starter_kit/data/repositories/auth_repository.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/index.dart';

import 'util/custom_routes.dart';
import 'views/pages/auth/login.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: customRoutes,
    );
  }
}
