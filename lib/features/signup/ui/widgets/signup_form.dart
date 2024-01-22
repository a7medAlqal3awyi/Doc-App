import 'package:doc_app/features/signup/logic/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widget/app_text_form_field.dart';
import '../../../login/ui/widgets/password_validations.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscuredText = true;
  bool isPasswordConfirmationObscuredText = true;
  bool isPasswordsMatch = false;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinimumLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(
      () {
        setState(
          () {
            hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
            hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
            hasSpecialCharacter =
                AppRegex.hasSpecialCharacter(passwordController.text);
            hasNumber = AppRegex.hasNumber(passwordController.text);
            hasMinimumLength = AppRegex.hasMinLength(passwordController.text);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(children: [
        AppTextFormField(
          hintText: 'Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid name';
            }
          },
          controller: context.read<SignupCubit>().nameController,
        ),
        verticalSpacing(10),
        AppTextFormField(
          hintText: 'Phone Number',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isPhoneNumberValid(value)) {
              return 'Please enter a valid number';
            }
          },
          controller: context.read<SignupCubit>().phoneController,
        ),
        verticalSpacing(10),
        AppTextFormField(
          hintText: 'Email',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return 'Please enter a valid email';
            }
          },
          controller: context.read<SignupCubit>().emailController,
        ),
        verticalSpacing(10),
        AppTextFormField(
          hintText: 'Password',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isPasswordValid(value)) {
              return 'Please enter a valid password';
            }
          },
          controller: context.read<SignupCubit>().passwordController,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordObscuredText = !isPasswordObscuredText;
              });
            },
            child: Icon(
              isPasswordObscuredText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          isSecureText: isPasswordObscuredText,
        ),
        verticalSpacing(10),
        AppTextFormField(
          hintText: 'Confirm Password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please the same password as above';
            }
          },
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordObscuredText = !isPasswordObscuredText;
              });
            },
            child: Icon(
              isPasswordObscuredText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          controller:
              context.read<SignupCubit>().passwordConfirmationController,
        ),
        PasswordValidations(
          hasLowerCase: hasLowerCase,
          hasUpperCase: hasUpperCase,
          hasSpecialCharacter: hasSpecialCharacter,
          hasNumber: hasNumber,
          hasMinimumLength: hasMinimumLength,
        ),
      ]),
    );
  }
}
