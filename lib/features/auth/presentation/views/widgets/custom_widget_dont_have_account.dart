import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/features/auth/presentation/views/signup_view.dart';

class CustomWidgetDontHaveAccount extends StatelessWidget {
  const CustomWidgetDontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك الحساب؟',
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            text: 'قم بإنشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: ColorApp.kPrimaryLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
