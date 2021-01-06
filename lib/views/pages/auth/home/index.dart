import 'package:flutter/material.dart';

import '../../../../util/size_config.dart';

class Home extends StatelessWidget {
  static const routeName = '/loggedin-home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockSizeHorizontal * 5.5),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/home.png')
          ],
        ),
      ),
    );
  }
}
