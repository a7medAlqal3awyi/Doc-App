import 'package:doc_app/core/themeing/styles.dart';
import 'package:flutter/material.dart';
class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(text: "Already have an account yet?",
        style:TextStyles.font14darkBlueW500 ),
        TextSpan(text: "Sign Up",
        style:TextStyles.font14BlueW600 ),


      ]
    ));
  }
}
