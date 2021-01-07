import 'package:flutter/material.dart';

import '../../../util/size_config.dart';
import '../../widgets/user_data_list_tile.dart';

class UserCoreData extends StatelessWidget {
  static const routeName = '/user-core-data-screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('User Core Data'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          UserDataListTile('status', 'Active'),
          Divider(),
          UserDataListTile('UserId', 'qwedq324'),
          Divider(),
          UserDataListTile('Email', 'dna@dna.com'),
          Divider(),
          UserDataListTile('Date Created', '07/01/2021'),
          Divider(),
        ],
      )),
    );
  }
}
