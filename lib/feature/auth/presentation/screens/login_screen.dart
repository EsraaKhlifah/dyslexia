import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:dyslexia_app/core/widget/custom_google_button.dart';
import 'package:dyslexia_app/feature/auth/presentation/components/text_form_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/commons.dart';
import '../cubit/login_cubit/login_cubit.dart';
import '../cubit/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {

                    if (state is LoginSuccessState) {
                      showToast(
                        message: 'Login Successfully',
                        state: ToastState.success,
                      );
                      navigateReplacement(
                        context: context,
                        route: Routes.home,
                      );
                    }
                    if (state is LoginErrorState) {
                      showToast(
                        message: state.message,
                        state: ToastState.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = BlocProvider.of<LoginCubit>(context);
                    return Form(
                      key: cubit.loginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: 60.h,
                          ),
                          Text(
                            'Welcome Back',
                            style: Theme.of(context)
                                .textTheme.displayMedium!
                                .copyWith(color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'Please Enter your Details',
                            style: Theme.of(context)
                                .textTheme.displayMedium!
                                .copyWith(color: AppColors.primary,
                              fontSize: 16.sp
                              //fontWeight: FontWeight.bold,
                            ),
                          ),


                          SizedBox(
                            height: 49.h,
                          ),


                          TextFormFieldComponent(
                            controller: cubit.emailController,
                            email: 'Email',
                              hintText: 'Email',
                              prefixIcon: const Icon(
                                Icons.email_outlined
                              ),
                            validator: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return "Please Enter Valid Email example@gmail.com";
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 29.h,
                          ),

                          TextFormFieldComponent(
                            controller:  cubit.passwordController,
                            email: 'Password',
                            hintText: 'Password',
                            prefixIcon: const Icon(
                                Icons.lock_outline_rounded
                            ),
                            obscureText: cubit.isLoginPasswordSowing,
                            iconSuffix: cubit.suffixIcon,
                            suffixIconOnPressed: () {
                              cubit.changeLoginPasswordSuffixIcon();
                            },
                            validator: (data) {
                              if (data!.length < 3 || data.isEmpty) {
                                return ' Please Enter Valid Password Length < 6';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 4.h,
                          ),

                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: (){

                                navigate(context: context, route: Routes.resetPassword);
                              },
                              child: Text(
                                'Forget Password?',
                                style: Theme.of(context)
                                    .textTheme.displayMedium!
                                    .copyWith(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary,
                                    fontSize: 16.sp
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),


                          SizedBox(
                            height: 102.h,
                          ),

                          state is LoginLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              :CustomButton(
                              onPressed: (){
                                if (cubit.loginKey.currentState!
                                    .validate()) {
                                 // Login Function

                                  cubit.login();

                                }
                              },
                              text: 'Login',
                          ),

                          SizedBox(
                            height: 28.h,
                          ),

                          CustomGoogleButton(
                            onPressed: (){},
                            text: 'Sign in With Google',
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
                                    .textTheme.displayMedium!
                                    .copyWith(color: AppColors.black,
                                    fontSize: 16.sp
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),

                              GestureDetector(
                                onTap: (){

                                  navigate(
                                    context: context,
                                    route: Routes.signUp,
                                  );


                                },
                                child: Text(
                                  'Sign up',
                                  style: Theme.of(context)
                                      .textTheme.displayMedium!
                                      .copyWith(color: AppColors.primary,
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
