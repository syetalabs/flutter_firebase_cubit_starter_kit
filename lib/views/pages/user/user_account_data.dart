import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../../util/size_config.dart';
import '../../widgets/user_data_list_tile.dart';

class UserAccountData extends StatelessWidget {
  static const routeName = '/user-account-data-screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('User Account Data'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          UserDataListTile('UserId', 'qwedq324'),
          Divider(),
          Container(
            color: Colors.grey,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Basic Account Info'),
                ),
              ],
            ),
          ),
          Divider(),
          UserDataListTile('Full name', 'Danushka Ariyarathna'),
          Divider(),
          UserDataListTile('Innitials', 'BS'),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 25,
                  child: Text('Avatar'),
                ),
                CircularProfileAvatar(
                  '',
                  child: Image.asset('assets/av1.png'),
                  radius: 50,
                ),
              ],
            ),
          ),
          Divider(),
        ],
      )),
    );
  }
}
