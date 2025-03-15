import 'package:flutter/material.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/custom_home_appbar.dart';

class CustomScrollHomeViewBody extends StatelessWidget {
  const CustomScrollHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomHomeAppbar(),
        ),
      ],
    );
  }
}
