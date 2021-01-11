import 'package:flutter/material.dart';
import '../../widgets/feature_button.dart';

class FirebaseCloudScreen extends StatelessWidget {
  static const routeName = '/fireebase-cloud-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Firebase Cloud'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureButton(
              heading: "Remote Config Text",
              onPressed: () {
                // Navigator.pushNamed(context, UserCoreData.routeName);
              },
            ),
            FeatureButton(
              heading: "Cloud Function Text / triggers",
              onPressed: () {
                //  Navigator.pushNamed(context, UserAccountData.routeName);
              },
            ),
            FeatureButton(
              heading: "Hosted Public Landing Page",
              onPressed: () {
                //  Navigator.pushNamed(context, UserAccountData.routeName);
              },
            ),
            FeatureButton(
              heading: "Cloud Storage Test",
              onPressed: () {
                //  Navigator.pushNamed(context, UserAccountData.routeName);
              },
            ),
            Container(
              color: Colors.grey,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Extensions'),
                  ),
                ],
              ),
            ),
            FeatureButton(
              heading: "Send Email",
              onPressed: () {
                //  Navigator.pushNamed(context, UserAccountData.routeName);
              },
            ),
            FeatureButton(
              heading: "Image Upload / Resize",
              onPressed: () {
                //  Navigator.pushNamed(context, UserAccountData.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
