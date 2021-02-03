import 'package:flutter/material.dart';
import '../../util/constants.dart';
import '../../util/size_config.dart';
import '../pages/app_config/index.dart';
import '../pages/auth/index.dart';
import '../pages/data_curd/index.dart';
import '../pages/firebase_cloud/index.dart';
import '../pages/image_upload/index.dart';
import '../pages/log_analy_crash/index.dart';
import '../pages/onboarding/index.dart';
import '../pages/theme/index.dart';
import '../pages/user/index.dart';
import '../pages/version/index.dart';
import 'feature_button.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: SizeConfig.blockSizeVertical * 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'StarterKit ',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockSizeHorizontal * 7,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: SizeConfig.blockSizeHorizontal * 9,
                          color: Colors.black,
                        ),
                        Icon(
                          Icons.circle,
                          size: SizeConfig.blockSizeHorizontal * 3,
                          color: PRIMARY_COLOR,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Icon(
                            Icons.copyright,
                            size: SizeConfig.blockSizeHorizontal * 2,
                            color: PRIMARY_COLOR,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              FeatureButton(
                  heading: "1-Onboarding",
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(OnboardingMainScreen.routeName);
                  }),
              FeatureButton(
                  heading: "2 Sign up/Sign in",
                  onPressed: () {
                    Navigator.of(context).pushNamed(AuthMainScreen.routeName);
                  }),
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
              FeatureButton(
                  heading: "Send Email / Templates", onPressed: () {}),
              FeatureButton(
                  heading: "Logging/Analytics/Crash",
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(LogAnalyCrashScreen.routeName);
                  }),
              FeatureButton(
                  heading: "Firebase Cloud App",
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(FirebaseCloudScreen.routeName);
                  }),
              FeatureButton(heading: "Font Awesome", onPressed: () {}),
              FeatureButton(
                  heading: "Version",
                  onPressed: () {
                    Navigator.of(context).pushNamed(VersionScreen.routeName);
                  }),
              FeatureButton(heading: "First Run", onPressed: () {}),
              FeatureButton(
                  heading: "Image Upload & Storage",
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ImageUploadScreen.routeName);
                  }),
              FeatureButton(
                  heading: "App Config Info",
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppConfigScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
