import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesFilter,
              ),
            ),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.imagesSearch),
            ),
          ),
          hintText: 'ابحث عن.......',
          hintStyle: TextStyles.regular13.copyWith(
            color: Color(0xff949D9E),
          ),
          border: CustomBorder(),
          enabledBorder: CustomBorder(),
          disabledBorder: CustomBorder(),
          focusedBorder: CustomBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder CustomBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xffF9FAFA)),
    );
  }
}
