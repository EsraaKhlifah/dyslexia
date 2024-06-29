import 'package:dyslexia_app/core/routes/app_routes.dart';
import 'package:dyslexia_app/core/utils/app_assets.dart';
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/utils/commons.dart';
import 'package:dyslexia_app/core/widget/back_widget.dart';
import 'package:dyslexia_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            children: [
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: BackWidget(
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 30.h,
              ),
              Text(
                'Ready for the test \nquestions, dear?',
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
      
              Image.asset(
                  AppAssets.qusImage,
                width: 330.w,
              ),
      
              SizedBox(
                height: 60.h,
              ),
              CustomButton(
                radius: 50,
                width: 200.w,
                onPressed: () {
      
                  navigate(context: context, route: Routes.questionScreen);
                },
                text: "let's start",
              ),
            ],
      
      
          ),
        ),
      ),
    );
  }
}
