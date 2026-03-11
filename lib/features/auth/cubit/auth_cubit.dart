import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqud/features/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  bool? obscurePasswordTextValue = true;
  String? name;
  String? phoneNumber;
  String? email;
  String? password;
  //! Obscure password text
  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;

    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginSuccessState());
  }

  Future<void> signUp() async {
    if (!signupFormKey.currentState!.validate()) return;

    emit(SignUpLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(SignUpSuccessState());
  }

  Future<void> sendResetLink() async {
    if (!forgotPasswordFormKey.currentState!.validate()) return;

    emit(ForgotPasswordLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(ForgotPasswordSuccessState());
  }
}
