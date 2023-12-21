import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/themeing/styles.dart';
import 'package:doc_app/features/login/widgets/already_have_an_account.dart';
import 'package:doc_app/features/login/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widget/app_text_form_field.dart';
import '../../core/widget/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueW700,
              ),
              verticalSpacing(8),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font13GreyW400.copyWith(fontSize: 14.sp),
              ),
              verticalSpacing(36),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const AppTextFormField(
                      hintText: "Email",
                    ),
                    verticalSpacing(18),
                    AppTextFormField(
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      isSecureText: isObscureText,
                    ),
                    verticalSpacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font13BlueW400,
                      ),
                    ),
                    verticalSpacing(40),
                    AppTextButton(
                        onPressed: () {},
                        buttonText: 'Login',
                        buttonTextStyle: TextStyles.font16WhiteW600),
                verticalSpacing(22),
                    const TermsAndConditions(),
                    verticalSpacing(22),

                    const AlreadyHaveAnAccount()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
