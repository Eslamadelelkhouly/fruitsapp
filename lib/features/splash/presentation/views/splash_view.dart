import 'package:flutter/material.dart';
import 'package:fruitsapp/constant.dart';
import 'package:fruitsapp/core/services/shared_perefernce_singletone.dart';
import 'package:fruitsapp/features/auth/presentation/views/signin_view.dart';
import 'package:fruitsapp/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:fruitsapp/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = "splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RouteOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashViewBody()),
    );
  }

  void RouteOnBoarding() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        bool IsBoaedingView = SharedPreferencesSingleton.getBool(
          kIsBoardingView,
        );
        if (IsBoaedingView == true) {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      },
    );
  }
}
