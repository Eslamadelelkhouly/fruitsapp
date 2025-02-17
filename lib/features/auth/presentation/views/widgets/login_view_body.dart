import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/core/widgets/custom_button.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            text: 'البريد الاكتروني',
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
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
          Text.rich(
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
          )
        ],
      ),
    );
  }
}
