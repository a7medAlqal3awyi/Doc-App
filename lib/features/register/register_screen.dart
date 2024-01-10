import 'package:doc_app/core/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/app_regex.dart';
import '../../core/helpers/spacing.dart';
import '../../core/themeing/styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
                    'Create Account',
                    style: TextStyles.font24BlueW700,
                  ),
                  verticalSpacing(8),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: TextStyles.font14GreyW400,
                  ),
                  verticalSpacing(8),
                  AppTextFormField(
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return 'Please enter a valid email';
                      }
                    },
                    controller: emailController,
                  ),
                  verticalSpacing(24),
                  AppTextFormField(
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return 'Please enter a valid password';
                      }
                    },
                    controller: passwordController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    isSecureText: isObscureText,
                  ),
                  verticalSpacing(24),
                  AppTextFormField(
                    hintText: 'Your number',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return 'Please enter a valid email';
                      }
                    },
                    controller: emailController,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
