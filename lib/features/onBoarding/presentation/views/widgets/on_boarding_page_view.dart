import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';
import 'package:fruitsapp/features/onBoarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          imageurl: Assets.imagesFruitSplash1,
          backgroundimageurl: Assets.imagesBackgroundSplash1,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            children: [
              Text('مرحبًا بك في'),
              Text('HUB'),
              Text('Fruit'),
            ],
          ),
        ),
      ],
    );
  }
}
