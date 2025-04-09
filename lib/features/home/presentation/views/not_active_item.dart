import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitsapp/features/home/domain/entities/bottom_navigation_bar_entity.dart';

class notActive extends StatelessWidget {
  const notActive({super.key, required this.bottomNavigationBarEntity});
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(bottomNavigationBarEntity.NoActiveImage);
  }
}
