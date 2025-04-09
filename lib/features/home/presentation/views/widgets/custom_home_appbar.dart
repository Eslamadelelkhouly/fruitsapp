import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';
import 'package:fruitsapp/core/widgets/notification_widget.dart';

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
      trailing: NotificationWidget(),
    );
  }
}

