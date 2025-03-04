import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitsapp/core/widgets/build_error_bar.dart';
import 'package:fruitsapp/features/auth/presentation/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSucess) {
          BuildErrorBar(context, 'تم التسجيل بنجاح');
        }
        if (state is SignUpFailures) {
          BuildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
