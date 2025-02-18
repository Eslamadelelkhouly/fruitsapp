import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {super.key, this.onPressed, required this.imageUrl, required this.title});
  final void Function()? onPressed;
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: BorderSide(
            color: Color(0xffDDDFDF),
          ),
        ),
        child: ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(imageUrl),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
