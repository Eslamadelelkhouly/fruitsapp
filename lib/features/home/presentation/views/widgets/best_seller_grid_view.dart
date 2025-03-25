import 'package:flutter/material.dart';
import 'package:fruitsapp/core/widgets/fruit_item.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}
