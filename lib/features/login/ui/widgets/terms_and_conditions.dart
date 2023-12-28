import 'package:doc_app/core/themeing/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign:TextAlign.center,
      
      text: TextSpan(children: [
        TextSpan(
            text: "By logging, you agree to our",
            style: TextStyles.font14moreLighterGreyW400),
        TextSpan(
            text: " Terms & Conditions ", style: TextStyles.font14darkBlueW500),

        TextSpan(text: "and", style: TextStyles.font14moreLighterGreyW400),
        TextSpan(
            text: " PrivacyPolicy. ", style: TextStyles.font14darkBlueW500),
      ]),
    );
  }
}
