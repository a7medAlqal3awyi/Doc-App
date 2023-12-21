import 'package:doc_app/core/themeing/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorManager.primary,
  );
  static TextStyle font13GreyW400 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.grey,
  );
  static TextStyle font16WhiteW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
