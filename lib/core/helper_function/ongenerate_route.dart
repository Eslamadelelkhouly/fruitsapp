import 'package:flutter/material.dart';
import 'package:fruitsapp/features/auth/presentation/views/login_view.dart';
import 'package:fruitsapp/features/auth/presentation/views/signup_view.dart';
import 'package:fruitsapp/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:fruitsapp/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
