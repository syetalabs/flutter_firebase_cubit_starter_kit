import 'package:flutter/material.dart';

import 'user_core_data.dart';
import '../../widgets/feature_button.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user-main-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
                heading: "User Core Data",
                onPressed: () {
                  Navigator.pushNamed(context, UserCoreData.routeName);
                }),
            FeatureButton(heading: "User Account Data", onPressed: () {}),
            FeatureButton(heading: "Custom User Data", onPressed: () {}),
          ],
        ),
      )),
    );
  }
}
