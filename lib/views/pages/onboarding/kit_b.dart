import 'package:flutter/material.dart';
import 'package:onboardme/onboardme.dart';

class OnboardKitB extends StatelessWidget {
  static const routeName = '/onboarding-kit-b';
  @override
  Widget build(BuildContext context) {
    return OnboardingMe(
      /// Number of Pages for the screens
      numOfPage: 5,

      /// No of colors you want for your screen
      noOfBackgroundColor: 4,

      /// List of background colors => In descending order
      bgColor: [
        Color(0xFF3594DD),
        Color(0xFF4563DB),
        Color(0xFF5036D5),
        Color(0xFF5B16D0),
      ],

      /// List of  Call-to-action action
      ctaText: ['Skip', 'Get Started'],

      /// List that maps your screen content
      screenContent: [
        {
          "Scr 1 Heading": "Screen 1 Heading Goes Here",
          "Scr 1 Sub Heading": "Screen 1 Sub Heading Goes Here",
          "Scr 1 Image Path": 'assets/av1.png',
        },
        {
          "Scr 2 Heading": "Screen 2 Heading Goes Here",
          "Scr 2 Sub Heading": "Screen 2 Sub Heading Goes Here",
          "Scr 2 Image Path": 'assets/av2.png',
        },
        {
          "Scr 3 Heading": "Screen 3 Heading Goes Here",
          "Scr 3 Sub Heading": "Screen 3 Sub Heading Goes Here",
          "Scr 3 Image Path": 'assets/av3.png',
        },
      ],

      /// Bool for Circle Page Indicator
      isPageIndicatorCircle: true,

      /// Home Screen Route that lands after on-boarding
      homeRoute: '/Home/',
    );
  }
}
