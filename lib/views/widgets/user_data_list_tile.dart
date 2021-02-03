import 'package:flutter/material.dart';
import '../../util/size_config.dart';

class UserDataListTile extends StatelessWidget {
  final String keyname;
  final String valuename;

  UserDataListTile(this.keyname, this.valuename);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
              width: SizeConfig.blockSizeHorizontal * 25, child: Text(keyname)),
          Text(
            valuename,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
