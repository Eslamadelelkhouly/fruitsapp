import 'package:flutter/material.dart';
import 'package:fruitsapp/core/widgets/custom_app_bar.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'حساب جديد'),
      body: SignupViewBody(),
    );
  }
}
