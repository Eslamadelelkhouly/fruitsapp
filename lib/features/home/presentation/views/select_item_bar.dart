import 'package:flutter/material.dart';
import 'package:fruitsapp/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruitsapp/features/home/presentation/views/active_item.dart';
import 'package:fruitsapp/features/home/presentation/views/not_active_item.dart';

class SelectActiveOrNotactive extends StatelessWidget {
  const SelectActiveOrNotactive(
      {super.key,
      required this.Selected,
      required this.bottomNavigationBarEntity});
  final bool Selected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Selected
          ? ActiveItem(
              text: bottomNavigationBarEntity.text,
              image: bottomNavigationBarEntity.ActiveImage,
            )
          : notActive(
              bottomNavigationBarEntity: bottomNavigationBarEntity,
            ),
    );
  }
}
