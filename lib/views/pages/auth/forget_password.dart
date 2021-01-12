import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../util/size_config.dart';

class ForgetPassword extends StatefulWidget {
  static const routeName = '/forget-password-screen';
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with WidgetsBindingObserver {
  TextEditingController _emailController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthError) {
            return Center(
              child: FlatButton(
                child: Text('Back to Login'),
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
            );
          } else if (state is PasswordRequestSubmitted) {
            return Center(
              child: FlatButton(
                child: Text('Back to Login'),
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
            );
          }
          return ResetForm(emailController: _emailController, context: context);
        },
        listener: (context, state) {
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
          } else if (state is PasswordRequestSubmitted) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Password reset link has been sent to your email'),
              ),
            );
          }
        },
      ),
    );
  }
}

class ResetForm extends StatelessWidget {
  const ResetForm({
    Key key,
    @required TextEditingController emailController,
    @required BuildContext context,
  })  : _emailController = emailController,
        _context = context,
        super(key: key);

  final TextEditingController _emailController;
  final BuildContext _context;

  void submitReset() {
    String email = _emailController.text.trim().toString();
    final authCubit = BlocProvider.of<AuthCubit>(_context);
    authCubit.submitPasswordReset(email);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Forget Password',
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
            MaterialButton(
              onPressed: submitReset,
              child: Text(
                'Submit',
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
              child: Text('Return to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
