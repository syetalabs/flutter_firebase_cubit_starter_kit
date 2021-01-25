import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_cubit_starter_kit/cubits/auth/auth_cubit.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/app_config/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/index.dart';

import 'package:flutter_firebase_cubit_starter_kit/views/pages/data_curd/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/firebase_cloud/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/image_upload/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/log_analy_crash/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/onboarding/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/theme/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/version/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/widgets/mian_drawer.dart';

import '../user/index.dart';
import '../../widgets/feature_button.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard-main-screen';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _birthdayController;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _birthdayController = TextEditingController();
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.isFirstRun();
    super.initState();
  }

  void updatePersonlData() {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.updatePersonalData(_firstNameController.text,
        _lastNameController.text, _birthdayController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('StartKit'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
              return Container();
            }, listener: (context, state) {
              if (state is AuthLoading) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Loading ...'),
                  ),
                );
              } else if (state is AuthError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('An Error Occured'),
                  ),
                );
              } else if (state is Authenticated) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You are authenticated '),
                  ),
                );
              } else if (state is FirstRun) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You are in the first Run'),
                  ),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        height: 300,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                hintText: 'FirstName',
                              ),
                            ),
                            TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                hintText: 'LastName',
                              ),
                            ),
                            TextFormField(
                              controller: _birthdayController,
                              decoration: InputDecoration(
                                hintText: 'Birthday',
                              ),
                            ),
                            MaterialButton(
                              onPressed: updatePersonlData,
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is PersonalDataUpdated) {
                Navigator.pop(context);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Updated Personal Data'),
                  ),
                );
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please Login'),
                  ),
                );
              }
            }),
          ],
        )),
      ),
    );
  }
}
