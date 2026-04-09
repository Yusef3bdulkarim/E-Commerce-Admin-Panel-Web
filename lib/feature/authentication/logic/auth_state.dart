part of 'auth_cubit.dart';

enum AuthStates { initial, loaded, loading, failure }

class AuthState {
  final AuthStates status;
  final String messageError;
  final bool isShowPassword;

  const AuthState(
      {this.status = AuthStates.initial,
      this.messageError = "",
      this.isShowPassword = false});

  AuthState copyWith(
      {AuthStates? status, String? messageError, bool? isShowPassword}) {
    return AuthState(
        status: status ?? this.status,
        messageError: messageError ?? this.messageError,
        isShowPassword: isShowPassword ?? this.isShowPassword);
  }
}
