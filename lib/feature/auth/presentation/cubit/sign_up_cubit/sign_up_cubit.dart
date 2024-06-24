
import 'package:dyslexia_app/feature/auth/data/models/login_model.dart';
import 'package:dyslexia_app/feature/auth/data/repository/auth_repository.dart';
import 'package:dyslexia_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepository authRepo;

  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoginPasswordSowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordSowing = !isLoginPasswordSowing;
    suffixIcon =
    isLoginPasswordSowing ? Icons.visibility : Icons.visibility_off;

    emit(ChangeSignUpPasswordSuffixIcon());
  }


  //login method
  LoginModel? loginModel;

  void signUp() async {
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
    );
    result.fold(
          (l) => emit(SignUpErrorState(errorMS: l)),
          (r) async {
        loginModel = r;
        // decodedToken
        String decodedToken = r.id.toString();
       // await sl<CacheHelper>().saveData(key: ApiKeys.id, value: decodedToken,);
        emit(SignUpSuccessState());

        emailController.clear();
        nameController.clear();
        phoneNumberController.clear();
        passwordController.clear();
      },
    );
  }



}