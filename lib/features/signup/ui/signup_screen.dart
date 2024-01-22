import 'package:doc_app/core/widget/app_button.dart';
import 'package:doc_app/features/signup/ui/widgets/already_have_an_account.dart';
import 'package:doc_app/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/themeing/styles.dart';
import '../../login/ui/widgets/terms_and_conditions.dart';
import '../logic/signup_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
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
              const SignupForm(),
              verticalSpacing(8),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "Forgot Password?",
                  style: TextStyles.font13BlueW400,
                ),
              ),
              verticalSpacing(10),
              AppTextButton(
                onPressed: () {
                  validateThenDoSignup(context);
                },
                buttonText: "Create Account",
                buttonTextStyle: TextStyles.font16WhiteW600,
              ),
              verticalSpacing(10),
              const TermsAndConditions(),
              verticalSpacing(10),
              const AlreadyHaveAnAccount()
            ],
          ),
        )),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
