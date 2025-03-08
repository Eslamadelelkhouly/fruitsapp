import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';
import 'package:fruitsapp/core/widgets/custom_button.dart';
import 'package:fruitsapp/features/auth/presentation/cubits/sign_in_cubits/sign_in_cubit.dart';
import 'package:fruitsapp/features/auth/presentation/views/signup_view.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_button_social.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_widget_dont_have_account.dart';
import 'package:fruitsapp/main.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Form(
          key: key,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                keyboardType: TextInputType.emailAddress,
                text: 'البريد الاكتروني',
              ),
              SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    autovalidateMode = AutovalidateMode.disabled;
                    context.read<SignInCubit>().signInEmailandPassword(
                          email: email,
                          password: password,
                        );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
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
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
                imageUrl: Assets.imagesGmailIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              SizedBox(
                height: 16,
              ),
              CustomButtonSocial(
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
                imageUrl: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
