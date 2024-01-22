import 'package:doc_app/core/helpers/exetention.dart';
import 'package:doc_app/core/themeing/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Already have an account!",
              style: TextStyles.font14darkBlueW500,
            ),
            TextSpan(
                text: "Login",
                style: TextStyles.font14BlueW600,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushNamed(Routes.loginScreen);
                  }),
          ],
        ),
      ),
    );
  }
}
