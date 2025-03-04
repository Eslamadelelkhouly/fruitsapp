import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/core/services/get_it_services.dart';
import 'package:fruitsapp/core/widgets/custom_app_bar.dart';
import 'package:fruitsapp/features/auth/domain/repos/auth_repo.dart';
import 'package:fruitsapp/features/auth/presentation/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(context, 'حساب جديد'),
        body: SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}

