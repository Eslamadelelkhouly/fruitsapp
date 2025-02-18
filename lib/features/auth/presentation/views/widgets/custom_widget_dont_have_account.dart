import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';

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
              text: 'قم بإنشاء حساب',
              style: TextStyles.semiBold16.copyWith(
                color: ColorApp.kPrimaryLightColor,
              )),
        ],
      ),
    );
  }
}
