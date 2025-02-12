import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/core/widgets/custom_button.dart';
import 'package:fruitsapp/features/onBoarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: ColorApp.kPrimaryColor,
            color: ColorApp.kPrimaryColor.withOpacity(.5),
          ),
        ),
        SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(),
        ),
        SizedBox(
          height: 43,
        ),
      ],
    );
  }
}
