import 'package:doc_app/core/helpers/exetention.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themeing/styles.dart';
import 'widgets/doc_image_and_text.dart';
import 'widgets/get_started_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(
                  height: 30.h,
                ),
                const DocImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        style: TextStyles.font14GreyW400,
                      ),
                      SizedBox(height: 30.h),
                      GetStartedButton(
                        onTap: () {
                          context.pushNamed(Routes.loginScreen);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
