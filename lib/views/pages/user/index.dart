import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/custom_user_data.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/user/user_account_data.dart';

import 'user_core_data.dart';
import '../../widgets/feature_button.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user-main-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('User'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
                heading: "User Core Data",
                onPressed: () {
                  Navigator.pushNamed(context, UserCoreData.routeName);
                }),
            FeatureButton(
                heading: "User Account Data",
                onPressed: () {
                  Navigator.pushNamed(context, UserAccountData.routeName);
                }),
            FeatureButton(
                heading: "Custom User Data",
                onPressed: () {
                  Navigator.pushNamed(context, CustomUserData.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
