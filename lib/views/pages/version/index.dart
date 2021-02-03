import 'package:flutter/material.dart';
import '../../widgets/user_data_list_tile.dart';
import 'package:package_info/package_info.dart';

class VersionScreen extends StatefulWidget {
  static const routeName = '/version-widget-screen';

  @override
  _VersionScreenState createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  String appName = '...';
  String packageName = '...';
  String version = '...';
  String buildNumber = '...';

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Version Widget'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          UserDataListTile('App Name', appName),
          Divider(),
          // UserDataListTile('Package Name', packageName),
          // Divider(),
          UserDataListTile('Version', version),
          Divider(),
          UserDataListTile('Build Number', buildNumber),
          Divider(),
        ],
      )),
    );
  }
}
