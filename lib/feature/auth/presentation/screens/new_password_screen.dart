import 'package:dyslexia_app/core/utils/app_assets.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:dyslexia_app/feature/auth/presentation/components/text_form_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/forget_password_cubit/forget_password_cubit.dart';
import '../cubit/forget_password_cubit/forget_password_state.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = BlocProvider.of<ForgetPasswordCubit>(context);
                  return Form(
                    key: cubit.newPasswordKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.primary,
                          ),),


                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppAssets.newPasswordImage,
                            height: 250,
                          ),
                        ),

                        SizedBox(
                          height: 20.h,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Enter The \nNew Password',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                              color: AppColors.primary,
                              //fontSize: 16.sp
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'your new password must be different\n from previously used password',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                color: AppColors.black,
                                fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),


                        SizedBox(
                          height: 40.h,
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
                            if (data!.length < 6 || data.isEmpty) {
                              return ' Please Enter Valid Password Length < 6';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 10.h,
                        ),

                        TextFormFieldComponent(
                          controller:  cubit.confirmPasswordController,
                          email: 'Confirm Password',
                          hintText: 'Confirm Password',
                          prefixIcon: const Icon(
                              Icons.lock_outline_rounded
                          ),
                          obscureText: cubit.isLoginPasswordSowing,
                          iconSuffix: cubit.suffixIcon,
                          suffixIconOnPressed: () {
                            cubit.changeLoginPasswordSuffixIcon();
                          },
                          validator: (data) {
                            if (cubit.passwordController != cubit.confirmPasswordController) {
                              return ' Please Enter Valid Password';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 30.h,
                        ),

                        CustomButton(
                          onPressed: () {
                            if (cubit.newPasswordKey.currentState!
                                .validate()) {
                              // SignUp Function

                            }

                          },
                          text: 'Done',
                        ),

                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
