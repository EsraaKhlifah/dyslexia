import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> sendCodedKey = GlobalKey<FormState>();
  GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController oneCodeController = TextEditingController();
  TextEditingController twoCodeController = TextEditingController();
  TextEditingController threeCodeController = TextEditingController();
  TextEditingController foreCodeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoginPasswordSowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordSowing = !isLoginPasswordSowing;
    suffixIcon =
    isLoginPasswordSowing ? Icons.visibility : Icons.visibility_off;

    emit(ChangeForgetPasswordPasswordSuffixIcon());
  }

}
