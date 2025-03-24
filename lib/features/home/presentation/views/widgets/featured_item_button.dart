import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 116,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: FittedBox(
          child: Text(
            'تسوق الان',
            style: TextStyles.bold13.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
