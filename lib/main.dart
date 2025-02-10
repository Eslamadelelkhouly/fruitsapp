import 'package:flutter/material.dart';
import 'package:fruitsapp/core/helper_function/ongenerate_route.dart';
import 'package:fruitsapp/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FuritHub());
}

class FuritHub extends StatelessWidget {
  const FuritHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
