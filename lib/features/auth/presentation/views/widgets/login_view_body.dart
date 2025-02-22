import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';
import 'package:fruitsapp/core/widgets/custom_button.dart';
import 'package:fruitsapp/features/auth/presentation/views/signup_view.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_button_social.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_widget_dont_have_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              text: 'البريد الاكتروني',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.visiblePassword,
              text: 'كلمة المرور',
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: ColorApp.kPrimaryLightColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 33,
            ),
            CustomButton(
              onPressed: () {},
              text: 'تسجيل دخول',
            ),
            SizedBox(
              height: 33,
            ),
            CustomWidgetDontHaveAccount(
              onTap: () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
              text1: 'لا تمتلك الحساب؟',
              text2: 'قم بإنشاء حساب',
            ),
            SizedBox(
              height: 37,
            ),
            CustomOrDivider(),
            SizedBox(
              height: 16,
            ),
            CustomButtonSocial(
              onPressed: () {},
              imageUrl: Assets.imagesGmailIcon,
              title: 'تسجيل بواسطة جوجل',
            ),
            SizedBox(
              height: 16,
            ),
            CustomButtonSocial(
              onPressed: () {},
              imageUrl: Assets.imagesAppleIcon,
              title: 'تسجيل بواسطة أبل',
            ),
            SizedBox(
              height: 16,
            ),
            CustomButtonSocial(
              onPressed: () {},
              imageUrl: Assets.imagesFacebookIcon,
              title: 'تسجيل بواسطة فيسبوك',
            ),
          ],
        ),
      ),
    );
  }
}
