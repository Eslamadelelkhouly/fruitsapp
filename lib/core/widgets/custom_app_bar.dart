import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';

AppBar CustomAppBar(BuildContext context, String text) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios),
    ),
    title: Text(
      text,
      style: TextStyles.bold19,
    ),
  );
}
