import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/themeing/app_colors.dart';
import 'package:doc_app/core/themeing/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinimumLength;

  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacter,
      required this.hasNumber,
      required this.hasMinimumLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lower case letter', hasLowerCase),
        verticalSpacing(2),
        buildValidationRow('At least 1 upper case letter', hasUpperCase),
        verticalSpacing(2),
        buildValidationRow('At least 1 special character', hasSpecialCharacter),
        verticalSpacing(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpacing(2),
        buildValidationRow('At least 8 character long', hasMinimumLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorManager.grey,
        ),
        horizontalSpacing(6),
        Text(
          text,
          style: TextStyles.font13darkBlueW500.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorManager.grey : ColorManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
