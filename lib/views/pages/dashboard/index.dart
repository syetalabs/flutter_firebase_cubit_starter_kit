import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/app_config/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/login.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/data_curd/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/firebase_cloud/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/image_upload/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/log_analy_crash/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/theme/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/version/index.dart';

import '../user/index.dart';
import '../../widgets/feature_button.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard-main-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            FeatureButton(
                heading: "1-Onboarding",
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(OnboardingMainScreen.routeName);
                }),
            FeatureButton(
                heading: "2 Sign up/Sign in",
                onPressed: () {
                  Navigator.of(context).pushNamed(AuthMainScreen.routeName);
                }),
            FeatureButton(
                heading: "User",
                onPressed: () {
                  Navigator.of(context).pushNamed(UserScreen.routeName);
                }),
            FeatureButton(heading: "UI Forms", onPressed: () {}),
            FeatureButton(
                heading: "Theme",
                onPressed: () {
                  Navigator.of(context).pushNamed(ThemeScreen.routeName);
                }),
            FeatureButton(
                heading: "Data Objects/CURD",
                onPressed: () {
                  Navigator.of(context).pushNamed(DataCurdScreen.routeName);
                }),
            FeatureButton(heading: "Send Email / Templates", onPressed: () {}),
            FeatureButton(
                heading: "Logging/Analytics/Crash",
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(LogAnalyCrashScreen.routeName);
                }),
            FeatureButton(
                heading: "Firebase Cloud App",
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(FirebaseCloudScreen.routeName);
                }),
            FeatureButton(heading: "Font Awesome", onPressed: () {}),
            FeatureButton(
                heading: "Version",
                onPressed: () {
                  Navigator.of(context).pushNamed(VersionScreen.routeName);
                }),
            FeatureButton(heading: "First Run", onPressed: () {}),
            FeatureButton(
                heading: "Image Upload & Storage",
                onPressed: () {
                  Navigator.of(context).pushNamed(ImageUploadScreen.routeName);
                }),
            FeatureButton(
                heading: "App Config Info",
                onPressed: () {
                  Navigator.of(context).pushNamed(AppConfigScreen.routeName);
                }),
          ],
        )),
      ),
    );
  }
}
