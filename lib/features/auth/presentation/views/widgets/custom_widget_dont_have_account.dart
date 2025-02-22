import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/features/auth/presentation/views/signup_view.dart';

class CustomWidgetDontHaveAccount extends StatelessWidget {
  const CustomWidgetDontHaveAccount({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1, text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyles.semiBold16.copyWith(
              color: ColorApp.kGrayColor,
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(
              color: ColorApp.kGrayColor,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text2,
            style: TextStyles.semiBold16.copyWith(
              color: ColorApp.kPrimaryLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
