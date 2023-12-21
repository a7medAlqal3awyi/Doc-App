import 'package:doc_app/core/themeing/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themeing/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 311.w,
        height: 52.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: ColorManager.primary),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            "Get Started",
            style: TextStyles.font16WhiteW600,
          ),
        ),
      ),
    );
  }
}
