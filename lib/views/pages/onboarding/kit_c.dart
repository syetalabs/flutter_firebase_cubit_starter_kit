import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_cubit_starter_kit/library/flutter_overboard/overboard.dart';
import 'package:flutter_firebase_cubit_starter_kit/library/flutter_overboard/page_model.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/auth_entry_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OnboardKitC extends StatefulWidget {
  static const routeName = '/onboarding-kit-c';
  @override
  _OnboardKitCState createState() => _OnboardKitCState();
}

class _OnboardKitCState extends State<OnboardKitC> {
  // create each page of onBoard here
  final _pageList = [
    PageModel(
        color: Colors.white,
        imageAssetPath: 'assets/bird1.png',
        title: 'Title of Page 1',
        body: 'Some subtitle and info for you to consider',
        doAnimateImage: true),
    PageModel(
        color: Colors.white,
        imageAssetPath: 'assets/bird2.png',
        title: 'Title of Page 2',
        body: 'Some subtitle and info for you to consider',
        doAnimateImage: true),
    PageModel(
        color: Colors.white,
        imageAssetPath: 'assets/bird1.png',
        title: 'Title of Page 3',
        body: 'Some subtitle and info for you to consider',
        doAnimateImage: true),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: OverBoard(
        pages: _pageList,
        showBullets: true,
        finishCallback: () {
          Navigator.of(context).pushNamed(AuthEntryScreen.routeName);
        },
      ),
    ));
  }
}
