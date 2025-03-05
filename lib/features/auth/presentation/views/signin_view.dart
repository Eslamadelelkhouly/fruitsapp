import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/core/services/get_it_services.dart';
import 'package:fruitsapp/core/widgets/custom_app_bar.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';
import 'package:fruitsapp/features/auth/presentation/cubits/sign_in_cubits/sign_in_cubit.dart';
import 'package:fruitsapp/features/auth/presentation/views/sign_in_view_body_bloc_consumer.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'Login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          context,
          'تسجيل دخول',
        ),
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}


