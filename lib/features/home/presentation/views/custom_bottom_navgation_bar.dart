import 'package:flutter/material.dart';
import 'package:fruitsapp/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruitsapp/features/home/presentation/views/select_item_bar.dart';

class CustomBottomNavgationBar extends StatefulWidget {
  const CustomBottomNavgationBar({super.key});

  @override
  State<CustomBottomNavgationBar> createState() =>
      _CustomBottomNavgationBarState();
}

class _CustomBottomNavgationBarState extends State<CustomBottomNavgationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItem.asMap().entries.map((entry) {
          var index = entry.key;
          var entity = entry.value;
          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: SelectActiveOrNotactive(
                Selected: selectedIndex == index,
                bottomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
