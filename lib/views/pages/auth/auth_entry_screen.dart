import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_cubit_starter_kit/cubits/auth/auth_cubit.dart';
import 'package:flutter_firebase_cubit_starter_kit/util/size_config.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/register.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/dashboard/index.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/widgets/feature_button.dart';

import 'login.dart';

class AuthEntryScreen extends StatefulWidget {
  static const routeName = '/auth-entry-screen';

  @override
  _AuthEntryScreenState createState() => _AuthEntryScreenState();
}

class _AuthEntryScreenState extends State<AuthEntryScreen> {
  void _registerWithGoogle() {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        child: Text('Login'))
                  ],
                ),
              ),
              Text(
                'Let\'s Begin',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                textAlign: TextAlign.center,
              ),
              Text('Sign up to do something fun and usefull with this app.'),
              FeatureButton(
                heading: "Continue with email",
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
              ),
              FeatureButton(
                heading: "Continue with Google",
                onPressed: _registerWithGoogle,
              ),
              BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
                return Container();
              }, listener: (context, state) {
                if (state is AuthLoading) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Loading...'),
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
                      content: Text('Register successful please Continue '),
                    ),
                  );
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Dashboard()));
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please Register'),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
