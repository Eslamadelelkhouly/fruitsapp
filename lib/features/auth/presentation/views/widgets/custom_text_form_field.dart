import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      this.suffixIcon,
      required this.keyboardType,
      this.obcureText = false,
      this.onSaved});
  final String text;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? onSaved;
  final bool? obcureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obcureText!,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'من فضلك ادخل البيانات المطلوبة';
        }
      },
      onSaved: onSaved,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: text,
        hintStyle: TextStyles.bold13,
        filled: true,
        fillColor: Color(0xffE6E9EA),
        border: CustomBorder(),
        enabledBorder: CustomBorder(),
        disabledBorder: CustomBorder(),
        focusedBorder: CustomBorder(),
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
