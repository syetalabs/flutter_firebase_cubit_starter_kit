import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/auth/auth_cubit.dart';
import '../home/index.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void login() {
    String email = _emailController.text.trim().toString();
    String password = _passwordController.text.trim().toString();
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
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
                    content: Text('Please wait until we log you in'),
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
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
