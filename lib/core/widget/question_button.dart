import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    this.background,
    required this.text,
    this.radius = 12,
    this.colorSide = Colors.transparent,
    this.check = false,
  });

  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;
  final double? radius;
  final Color? colorSide ;
  final bool? check ;

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              text,
              style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp),
            ),

            const Spacer(),

            check != false ? const Icon(
              Icons.check_circle,
              color: AppColors.white,
              size: 35,
            ) : const SizedBox()


          ],
        ),
      ),
    );
  }
}
