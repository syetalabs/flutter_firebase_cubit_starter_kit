import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/user.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());

  Future login(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authRepository.login(email, password);
      User currentUser = _authRepository.currentUser();
      if (currentUser != null) {
        emit(Authenticated(currentUser));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future loginWithGoogle() async {
    try {
      emit(AuthLoading());
      await _authRepository.signInWithGoogle();
      User currentUser = _authRepository.currentUser();
      if (currentUser != null) {
        emit(Authenticated(currentUser));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future register(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authRepository.register(email, password);
      User currentUser = _authRepository.currentUser();
      emit(Authenticated(currentUser));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future logout() async {
    try {
      emit(AuthLoading());
      await _authRepository.logout();
      emit(NotAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future submitPasswordReset(String email) async {
    try {
      emit(AuthLoading());
      await _authRepository.passwordResetSubmit(email);
      emit(PasswordRequestSubmitted());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void isLoggedIn() {
    try {
      emit(AuthLoading());
      if (_authRepository.currentUser() != null) {
        User currentUser = _authRepository.currentUser();
        emit(Authenticated(currentUser));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
