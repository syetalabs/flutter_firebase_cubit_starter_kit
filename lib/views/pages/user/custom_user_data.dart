import 'package:flutter/material.dart';

import '../../../util/size_config.dart';
import '../../widgets/user_data_list_tile.dart';

class CustomUserData extends StatelessWidget {
  static const routeName = '/user-custom-data-screen';
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
            UserDataListTile('UserId', 'qwedq324'),
            Divider(),
            Container(
              color: Colors.grey,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Custom User Data'),
                  ),
                ],
              ),
            ),
            Divider(),
            UserDataListTile('Date Created', '07/01/2021'),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Interests'),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text('Stuff'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text('Stuff'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text('Stuff'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text('Stuff'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
