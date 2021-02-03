import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../util/constants.dart';
import '../../../util/size_config.dart';
import 'register.dart';
import '../dashboard/index.dart';
import '../../widgets/icon_text_button.dart';

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1,
                horizontal: SizeConfig.blockSizeHorizontal * 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      child: Text('Login'))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1,
                horizontal: SizeConfig.blockSizeHorizontal * 10,
              ),
              child: Column(
                children: [
                  Text(
                    'Let\'s Begin',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'HelveticaNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                      'Sign up to do something fun and usefull with this app.'),
                  IconTextButton(
                    bgColor: Colors.black,
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                    ),
                    heading: "Continue with email",
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                  ),
                  IconTextButton(
                    bgColor: GOOGLE_RED,
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                    ),
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
          ],
        ),
      ),
    );
  }
}
