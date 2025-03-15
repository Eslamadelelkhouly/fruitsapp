import 'package:flutter/material.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/custom_scroll_home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollHomeViewBody()),
    );
  }
}
