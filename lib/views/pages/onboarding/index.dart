import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/kit_a.dart';
import '../../widgets/feature_button.dart';
import 'kit_b.dart';

class OnboardingMainScreen extends StatelessWidget {
  static const routeName = '/onboarding-main-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Onboarding'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
                heading: "OnBoard Slides Kit-A",
                onPressed: () {
                  Navigator.pushNamed(context, OnboardKitA.routeName);
                }),
            FeatureButton(
                heading: "OnBoard Slides Kit-B (onboardme)",
                onPressed: () {
                  Navigator.pushNamed(context, OnboardKitB.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
