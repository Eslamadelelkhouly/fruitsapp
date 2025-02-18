import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        const Text(
          'أو',
          style: TextStyles.semiBold16,
        ),
        const SizedBox(
          width: 18,
        ),
        const Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
          ),
        ),
      ],
    );
  }
}
