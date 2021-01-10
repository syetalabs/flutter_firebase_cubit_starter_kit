import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/data_curd/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/theme/index.dart';

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
