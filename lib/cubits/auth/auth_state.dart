part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  final User user;
  const Authenticated(this.user);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Authenticated && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class NotAuthenticated extends AuthState {
  const NotAuthenticated();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class Registered extends AuthState {
  const Registered();
}
