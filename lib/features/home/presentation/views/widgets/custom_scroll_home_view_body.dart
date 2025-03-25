import 'package:flutter/material.dart';
import 'package:fruitsapp/constant.dart';
import 'package:fruitsapp/core/widgets/fruit_item.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/best_seller_grid_view.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/best_seller_text.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/custom_text_field_search.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/featured_list.dart';

class CustomScrollHomeViewBody extends StatelessWidget {
  const CustomScrollHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: khight,
                ),
                CustomHomeAppbar(),
                SizedBox(
                  height: khight,
                ),
                CustomTextFieldSearch(),
                SizedBox(
                  height: 12,
                ),
                FeaturedList(),
                SizedBox(
                  height: 12,
                ),
                BestSellerText(),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          BestSellerGridView(),
        ],
      ),
    );
  }
}
