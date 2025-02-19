import 'package:flutter/material.dart';
import 'package:fruitsapp/core/widgets/custom_app_bar.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        'تسجيل دخول',
      ),
      body: LoginViewBody(),
    );
  }
}
