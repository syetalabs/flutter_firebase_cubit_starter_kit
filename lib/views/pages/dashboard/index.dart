import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/widgets/feature_button.dart';

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
                heading: "User",
                onPressed: () {
                  Navigator.of(context).pushNamed(UserScreen.routeName);
                }),
            FeatureButton(heading: "UI Forms", onPressed: () {}),
            FeatureButton(heading: "Theme", onPressed: () {}),
            FeatureButton(heading: "Data Objects/CURD", onPressed: () {}),
            FeatureButton(heading: "Send Email / Templates", onPressed: () {}),
            FeatureButton(heading: "Logging/Analytics/Crash", onPressed: () {}),
            FeatureButton(heading: "Firebase Cloud App", onPressed: () {}),
            FeatureButton(heading: "Font Awesome", onPressed: () {}),
            FeatureButton(heading: "Version", onPressed: () {}),
            FeatureButton(heading: "First Run", onPressed: () {}),
            FeatureButton(heading: "Login / Register", onPressed: () {}),
            FeatureButton(heading: "Image Upload & Storage", onPressed: () {}),
            FeatureButton(heading: "App Config Info", onPressed: () {}),
          ],
        )),
      ),
    );
  }
}
