import 'package:flutter/material.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
