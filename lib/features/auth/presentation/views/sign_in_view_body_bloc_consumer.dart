import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/core/widgets/build_error_bar.dart';
import 'package:fruitsapp/core/widgets/custom_model_progress_hud.dart';
import 'package:fruitsapp/features/auth/presentation/cubits/sign_in_cubits/sign_in_cubit.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
      if (state is SignInSucess) {
          BuildErrorBar(context, 'تم تسجيل الدخول بنجاح');
        }
        if (state is SignInFailures) {
          BuildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModelProgressHud(
          inAsyncCall: state is SignInLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}
