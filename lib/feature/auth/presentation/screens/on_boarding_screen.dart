import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/utils/app_assets.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.primary.withOpacity(0.4),
                  AppColors.primary.withOpacity(0.4),
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.primary,
                ])),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Text(
             'Enjoy a different\n experience for\n dyslexics in our\n application',
             textAlign: TextAlign.center,
             style: Theme.of(context)
                 .textTheme.displayMedium!
                 .copyWith(
               fontSize: 30,
               color: AppColors.white,
               fontWeight: FontWeight.w500,
             ),
           ),
           SizedBox(
             height: 50.h,
           ),
           
           Image.asset(AppAssets.appLogo),

           SizedBox(
             height: 50.h,
           ),
           CustomButton(
             radius: 50,
             width: 200.w,
             onPressed: () {

               navigate(context: context, route: Routes.login);
             },
             text: 'Get Started',
           ),
         ],


        ),
      ),
    );
  }
}
