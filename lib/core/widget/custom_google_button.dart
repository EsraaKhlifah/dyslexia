import 'package:dyslexia_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    this.background,
    required this.text,
  });

  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
          backgroundColor: MaterialStateProperty.all(
            background ?? AppColors.white,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(
                AppAssets.logoGoogle,width: 30,height: 30,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                text,
                style:
                Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 20.sp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
