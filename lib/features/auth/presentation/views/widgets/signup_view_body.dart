import 'package:flutter/material.dart';
import 'package:fruitsapp/core/widgets/custom_button.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_check_box.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_widget_dont_have_account.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

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
              text: 'الاسم كامل',
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              text: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              text: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextCheckBox(),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () {},
              text: 'إنشاء حساب جديد',
            ),
            SizedBox(
              height: 26,
            ),
            CustomWidgetDontHaveAccount(
              onTap: () {
                Navigator.of(context).pop();
              },
              text1: 'تمتلك حساب بالفعل؟ ',
              text2: 'تسجيل الدخول',
            ),
          ],
        ),
      ),
    );
  }
}
