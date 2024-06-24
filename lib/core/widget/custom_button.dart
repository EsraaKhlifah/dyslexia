import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    this.background,
    required this.text,
     this.radius = 12,
    this.colorSide = Colors.transparent,
  });

  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;
  final double? radius;
  final Color? colorSide ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: background ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
            side:  BorderSide(width: 3, color: colorSide!),

          ),
        ),
        child: Text(
          text,
          style:
          Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp),
        ),
      ),
    );
  }
}
