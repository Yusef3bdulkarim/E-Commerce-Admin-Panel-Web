import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_ecommerce_admin_panel/core/service_git_it/service_locator.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/data/repo/auth_repo.dart';

import '../data/model/auth_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final repo = getIt<AuthRepo>();

  AuthCubit() : super(AuthState());

  Future<void> login({required String email, required String pass}) async {
    emit(state.copyWith(status: AuthStates.loading));

    try {
      await repo.signInAdmin(email, pass);
      emit(state.copyWith(status: AuthStates.loaded));
    } catch (e) {
      emit(state.copyWith(
          messageError: e.toString(), status: AuthStates.failure));
    }
  }

  Future<void> createNewAdmin(
      {required AuthModel newAdmin, required String password}) async {
    emit(state.copyWith(status: AuthStates.loading));

    try {
      await repo.createNewAdmin(newAdmin, password);
      emit(state.copyWith(status: AuthStates.loaded));
    } catch (e) {
      emit(state.copyWith(
          messageError: e.toString(), status: AuthStates.failure));
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    emit(state.copyWith(status: AuthStates.loading));

    try {
      await repo.sendPasswordResetEmail(email);
      emit(state.copyWith(status: AuthStates.loaded));
    } catch (e) {
      emit(state.copyWith(
          messageError: e.toString(), status: AuthStates.failure));
    }
  }
  Future<void> signOut() async {
    emit(state.copyWith(status: AuthStates.loading));

    try {
      await repo.signOut();
      emit(state.copyWith(status: AuthStates.loaded));
    } catch (e) {
      emit(state.copyWith(
          messageError: e.toString(), status: AuthStates.failure));
    }
  }
  void toggleShowPassword(){
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }
}
