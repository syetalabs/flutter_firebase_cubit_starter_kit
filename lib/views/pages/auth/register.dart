import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_cubit_starter_kit/util/size_config.dart';

import 'login.dart';
import '../../../cubits/auth/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with WidgetsBindingObserver {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void register() {
    String email = _emailController.text.trim().toString();
    String password = _passwordController.text.trim().toString();
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.register(email, password);
  }

  @override
  Widget build(BuildContext context) {
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
                      content: Text('Loading...'),
                    ),
                  );
                } else if (state is AuthError) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('An Error Occured'),
                    ),
                  );
                } else if (state is Registered) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Register successful please log in '),
                    ),
                  );
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please Register'),
                    ),
                  );
                }
              }),
              Text(
                'Register',
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
                onPressed: register,
                child: Text(
                  'Register',
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
