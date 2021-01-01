import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/util/size_config.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(
                'Home',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                textAlign: TextAlign.center,
              ), Image.asset('assets/home.png')],
        ),
      ),
    );
  }
}
