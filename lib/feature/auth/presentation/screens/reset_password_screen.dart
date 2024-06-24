import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/utils/app_assets.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:dyslexia_app/feature/auth/presentation/components/text_form_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/forget_password_cubit/forget_password_cubit.dart';
import '../cubit/forget_password_cubit/forget_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                    key: cubit.resetPasswordKey,
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
                              AppAssets.forgetPasswordImage,
                            height: 300,
                          ),
                        ),

                        SizedBox(
                          height: 34.h,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Reset \nPassword',
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
                          height: 40.h,
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
                          height: 50.h,
                        ),

                        CustomButton(
                          onPressed: () {
                            if (cubit.resetPasswordKey.currentState!
                                .validate()) {
                              // Login Function

                              navigate(
                                context: context,
                                route: Routes.sendCode,
                              );

                            }

                          },
                          text: 'Reset',
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
