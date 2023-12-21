import 'package:doc_app/core/themeing/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 14.w),
          child: SvgPicture.asset("assets/svgs/doc_logo_opacity.svg"),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.14, 0.4],
          )),
          child: const Image(
            image: AssetImage(
              "assets/images/onboarding_doc.png",
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 5,
          left: 5,
          child: Text(
            "Best Doctor Appointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
          ),
        )
      ],
    );
  }
}
