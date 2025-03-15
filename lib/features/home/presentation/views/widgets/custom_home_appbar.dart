import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        Assets.imagesProfilephoto,
        scale: 0.5,
      ),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.semiBold16.copyWith(
          color: Color(0xff949D9E),
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: TextStyles.bold16,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffEEF8ED),
        ),
        padding: const EdgeInsets.all(15),
        child: SvgPicture.asset(
          Assets.imagesNotification,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
