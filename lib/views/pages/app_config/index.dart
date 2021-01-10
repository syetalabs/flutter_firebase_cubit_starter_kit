import 'package:flutter/material.dart';
import '../../widgets/user_data_list_tile.dart';

class AppConfigScreen extends StatelessWidget {
  static const routeName = '/app-config-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('App Config'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          UserDataListTile('status', 'Active'),
          Divider(),
          UserDataListTile('Domain', 'paperplayer.co'),
          Divider(),
          UserDataListTile('Email', 'support@paperplayer.co'),
          Divider(),
          UserDataListTile('Password', 'qwer1234'),
          Divider(),
          UserDataListTile('Google Map', 'qwer1234'),
          Divider(),
          UserDataListTile('FB analytics', 'qwer1234'),
          Divider(),
          UserDataListTile('FB Crshlytics', 'qwer1234'),
          Divider(),
        ],
      )),
    );
  }
}
