import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruitsapp/core/helper_function/ongenerate_route.dart';
import 'package:fruitsapp/features/splash/presentation/views/splash_view.dart';
import 'package:fruitsapp/generated/l10n.dart';

void main() {
  runApp(const FuritHub());
}

class FuritHub extends StatelessWidget {
  const FuritHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
