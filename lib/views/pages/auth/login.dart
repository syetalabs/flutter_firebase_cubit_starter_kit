import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/forget_password.dart';

import 'home/index.dart';
import 'register.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../util/size_config.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // FirebaseCrashlytics.instance.crash();
    super.initState();
  }

  void login() {
    String email = _emailController.text.trim().toString();
    String password = _passwordController.text.trim().toString();
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.login(email, password);
  }

  void loginWithGoogle() {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please Login'),
                    ),
                  );
                }
              }),
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              MaterialButton(
                onPressed: login,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen()));
                },
                child: Text('Register'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ForgetPassword.routeName);
                },
                child: Text('Forget Password?'),
              ),
              // MaterialButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Login with Facebook',
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              //   color: Colors.black,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(4))),
              // ),
              MaterialButton(
                onPressed: loginWithGoogle,
                child: Text(
                  'Login with Google',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
