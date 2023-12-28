import 'package:doc_app/core/themeing/app_colors.dart';
import 'package:doc_app/core/themeing/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsDirectional? contentPadding;
  final InputBorder? focusBorder;
  final InputBorder? enableBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isSecureText;
  final Widget? suffixIcon;
  final Color? background;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({super.key,
    this.contentPadding,
    this.focusBorder,
    this.enableBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isSecureText,
    this.suffixIcon,
    this.background,
    this.controller,
    required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecureText ?? false,
      style: TextStyles.font14darkBlueW500,
      controller: controller,
      decoration: InputDecoration(
        fillColor: background ?? ColorManager.moreLightGrey,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        hintStyle: hintStyle ?? TextStyles.font14lightGreyW500,
        hintText: hintText,
        suffixIcon: suffixIcon,
        enabledBorder: enableBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.w),
              borderSide:
              BorderSide(color: ColorManager.lighterGrey, width: 1.3.w),
            ),
        focusedBorder: focusBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.w),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.3.w),
            ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.3,

            ),
            borderRadius: BorderRadius.circular(16)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.3,

            ),
            borderRadius: BorderRadius.circular(16)
        ),
      ),
      validator: (value){
        return validator(value);
      },
    );
  }
}
