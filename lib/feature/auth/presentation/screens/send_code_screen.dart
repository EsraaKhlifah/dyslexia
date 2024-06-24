import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/utils/app_assets.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:dyslexia_app/feature/auth/presentation/components/verify_code_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/forget_password_cubit/forget_password_cubit.dart';
import '../cubit/forget_password_cubit/forget_password_state.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

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
                    key: cubit.sendCodedKey,
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
                            AppAssets.verifyCodeImage,
                            height: 250,
                          ),
                        ),

                        SizedBox(
                          height: 20.h,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'verify code',
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
                          height: 4.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'please enter the code we just sent to email',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                              color: AppColors.black,
                              fontSize: 14.sp
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'esraakhlifah@gmail.com',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                color: AppColors.primary,
                                fontSize: 14.sp
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),


                        VerifyCodeComponent(
                            controller1: cubit.oneCodeController,
                            controller2: cubit.twoCodeController,
                            controller3: cubit.threeCodeController,
                            controller4: cubit.foreCodeController,
                        ),


                        SizedBox(
                          height: 70.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Didn't receive code?",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                color: AppColors.black,
                                fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 8.h,
                        ),
                        GestureDetector(
                          onTap: (){


                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'resend code',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  color: AppColors.primary,
                                  fontSize: 18.sp,
                                 fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50.h,
                        ),

                        CustomButton(
                          onPressed: () {

                            navigate(
                              context: context,
                              route: Routes.newPassword,
                            );
                          },
                          text: 'Verify',
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
