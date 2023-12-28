import 'package:doc_app/core/helpers/app_regex.dart';
import 'package:doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widget/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinimumLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
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
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          verticalSpacing(36),
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpacing(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid password';
              }
            },
            hintText: "Password",
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
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasMinimumLength: hasMinimumLength,
            hasSpecialCharacter: hasSpecialCharacter,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
          )
        ],
      ),
    );


  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
