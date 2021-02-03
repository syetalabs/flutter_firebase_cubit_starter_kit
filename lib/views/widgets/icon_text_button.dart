import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final Icon icon;
  final String heading;
  final Color bgColor;
  final Function onPressed;
  IconTextButton(
      {@required this.heading,
      @required this.onPressed,
      @required this.icon,
      @required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: RaisedButton(
        color: bgColor,
        onPressed: onPressed,
        // borderSide:
        //     BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1),
        child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 1, child: icon),
            Flexible(
              flex: 7,
              child: Center(
                child: Text(
                  heading,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
