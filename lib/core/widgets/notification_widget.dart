import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffEEF8ED),
      ),
      padding: const EdgeInsets.all(15),
      child: SvgPicture.asset(
        Assets.imagesNotification,
        fit: BoxFit.cover,
      ),
    );
  }
}
