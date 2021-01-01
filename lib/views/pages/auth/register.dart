import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';
import '../../../cubits/auth/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with WidgetsBindingObserver  {
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
      appBar: AppBar(
        title: Text('Register'),
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
              child: Text('Register'),
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
    );
  }
}
