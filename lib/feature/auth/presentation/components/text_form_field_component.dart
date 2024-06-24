
import 'package:dyslexia_app/core/utils/app_colors.dart';
import 'package:dyslexia_app/core/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key,
    required this.email,
    required this.prefixIcon,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIconOnPressed,
    this.iconSuffix,
    this.hintText, this.keyboardType,
  });

  final String email;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText ;
  final void Function()? suffixIconOnPressed;
  final IconData? iconSuffix;
  final String? hintText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          email,
          style: Theme.of(context)
              .textTheme.displayMedium!
              .copyWith(color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp

          ),
        ),

        SizedBox(
          height: 4.h,
        ),

        CustomTextFormField(
          controller: controller,
          prefixIcon: prefixIcon,
          hintText: hintText,
          validator: validator,
          obscureText: obscureText,
          suffixIconOnPressed: suffixIconOnPressed,
          iconSuffix: iconSuffix,
          keyboardType: keyboardType,


        ),
      ],
    );
  }
}
