import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/features/auth/presentation/views/widgets/custom_check_box.dart';

class CustomTextCheckBox extends StatefulWidget {
  const CustomTextCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<CustomTextCheckBox> createState() => _CustomTextCheckBoxState();
}

class _CustomTextCheckBoxState extends State<CustomTextCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChanged: (value) {
            isChecked = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isChecked,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xFF616A6B),
                  ),
                ),
                TextSpan(
                    text: 'الشروط والأحكام',
                    style: TextStyles.semiBold13.copyWith(
                      color: ColorApp.kPrimaryLightColor,
                    )),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xFF616A6B),
                  ),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: TextStyles.semiBold13.copyWith(
                    color: ColorApp.kPrimaryLightColor,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xFF616A6B),
                  ),
                ),
                TextSpan(
                  text: 'بنا',
                  style: TextStyles.semiBold11.copyWith(
                    color: ColorApp.kPrimaryLightColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
