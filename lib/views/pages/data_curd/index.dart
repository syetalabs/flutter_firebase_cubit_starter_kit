import 'package:flutter/material.dart';
import '../../widgets/feature_button.dart';

class DataCurdScreen extends StatelessWidget {
  static const routeName = '/data-curd-screen';
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
                heading: "User Data Objects",
                onPressed: () {
                  // Navigator.pushNamed(context, UserCoreData.routeName);
                }),
            FeatureButton(
                heading: "System Data objects",
                onPressed: () {
                  //  Navigator.pushNamed(context, UserAccountData.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
