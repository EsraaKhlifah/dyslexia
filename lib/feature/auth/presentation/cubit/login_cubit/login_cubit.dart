
import 'package:dyslexia_app/core/database/api/end_points.dart';
import 'package:dyslexia_app/core/database/cache/cache_helper.dart';
import 'package:dyslexia_app/core/service/service_locator.dart';
import 'package:dyslexia_app/feature/auth/data/models/login_model.dart';
import 'package:dyslexia_app/feature/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepository authRepo;

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoginPasswordSowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordSowing = !isLoginPasswordSowing;
    suffixIcon =
    isLoginPasswordSowing ? Icons.visibility : Icons.visibility_off;

    emit(ChangeLoginPasswordSuffixIcon());
  }


  //login method
  LoginModel? loginModel;

  void login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
          (l) => emit(LoginErrorState(l)),
          (r) async {
        loginModel = r;
        // decodedToken
        String decodedToken = r.id.toString();
        await sl<CacheHelper>().saveData(key: ApiKeys.id, value: decodedToken,);
        emit(LoginSuccessState());

        emailController.clear();
        passwordController.clear();
      },
    );
  }
}
