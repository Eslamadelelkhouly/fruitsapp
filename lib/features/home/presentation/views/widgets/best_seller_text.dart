import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';

class BestSellerText extends StatelessWidget {
  const BestSellerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الاكثر مبيعا',
          style: TextStyles.bold16,
        ),
        Spacer(),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
