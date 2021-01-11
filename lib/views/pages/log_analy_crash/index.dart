import 'package:flutter/material.dart';
import '../../widgets/feature_button.dart';

class LogAnalyCrashScreen extends StatelessWidget {
  static const routeName = '/log-analy-crash-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Data CURD'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
                heading: "Anyalitics",
                onPressed: () {
                  // Navigator.pushNamed(context, UserCoreData.routeName);
                }),
            FeatureButton(
                heading: "Crashlitics",
                onPressed: () {
                  //  Navigator.pushNamed(context, UserAccountData.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
