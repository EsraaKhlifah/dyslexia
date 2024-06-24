import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:dyslexia_app/core/widget/custom_google_button.dart';
import 'package:dyslexia_app/feature/auth/presentation/components/text_form_field_component.dart';
import 'package:dyslexia_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:dyslexia_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccessState) {
                      showToast(
                        message: 'SignUp Successfully',
                        state: ToastState.success,
                      );
                      Navigator.pop(context);
                    }
                    if (state is SignUpErrorState) {
                      showToast(
                        message: state.errorMS,
                        state: ToastState.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = BlocProvider.of<SignUpCubit>(context);
                    return Form(
                      key: cubit.signUpKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.primary,
                                  )),
                              Text(
                                'Welcome',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 49.h,
                          ),
                          TextFormFieldComponent(
                            controller: cubit.nameController,
                            email: 'Name',
                            hintText: 'Name',
                            prefixIcon:
                                const Icon(Icons.drive_file_rename_outline),
                            validator: (data) {
                              if (data!.isEmpty) {
                                return "Please Enter Your Name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          TextFormFieldComponent(
                            controller: cubit.phoneNumberController,
                            email: 'Phone Number',
                            hintText: 'Phone Number',
                            keyboardType: TextInputType.phone,
                            prefixIcon:
                                const Icon(Icons.phone_android_outlined),
                            validator: (data) {
                              if (data!.isEmpty) {
                                return "Please Enter Your Phone Number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          TextFormFieldComponent(
                            controller: cubit.emailController,
                            email: 'Email',
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            validator: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return "Please Enter Valid Email example@gmail.com";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          TextFormFieldComponent(
                            controller: cubit.passwordController,
                            email: 'Password',
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            obscureText: cubit.isLoginPasswordSowing,
                            iconSuffix: cubit.suffixIcon,
                            suffixIconOnPressed: () {
                              cubit.changeLoginPasswordSuffixIcon();
                            },
                            validator: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return ' Please Enter Valid Password Length < 6';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            height: 72.h,
                          ),
                          state is SignUpLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  onPressed: () {
                                    if (cubit.signUpKey.currentState!
                                        .validate()) {
                                      // SignUp Function

                                      cubit.signUp();
                                    }
                                  },
                                  text: 'Sign Up',
                                ),
                          SizedBox(
                            height: 28.h,
                          ),
                          CustomGoogleButton(
                            onPressed: () {},
                            text: 'Sign Up With Google',
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'don’t have an account? ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: AppColors.black, fontSize: 16.sp
                                        //fontWeight: FontWeight.bold,
                                        ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Sign in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: AppColors.primary,
                                          fontSize: 16.sp
                                          //fontWeight: FontWeight.bold,
                                          ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
