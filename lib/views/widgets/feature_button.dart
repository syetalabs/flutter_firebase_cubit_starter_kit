import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  final String heading;
  final Function onPressed;
  FeatureButton({this.heading, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: OutlineButton(
        color: Colors.black,
        onPressed: onPressed,
        borderSide:
            BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              heading,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
