import 'package:flutter/material.dart';
import 'package:fruitsapp/features/best_seller_fruits/presentation/views/widgets/best_seller_body.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});
  static const String routeName = '/BestSellerView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BestSellerBody(),
    );
  }
}