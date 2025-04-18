import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/core/widgets/build_error_bar.dart';
import 'package:fruitsapp/core/widgets/custom_button.dart';
import 'package:fruitsapp/features/auth/presentation/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_check_box.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_widget_dont_have_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Form(
          key: key,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                text: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                text: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
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
              CustomTextCheckBox(
                onChanged: (value) {
                  isCheck = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    autovalidateMode = AutovalidateMode.disabled;
                    if (isCheck) {
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailandPassword(
                              email, password, name);
                    } else {
                      BuildErrorBar(
                          context, 'يجب الموافقة على الشروط والاحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
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
      ),
    );
  }
}
