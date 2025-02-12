import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';
import 'package:fruitsapp/features/onBoarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          imageurl: Assets.imagesFruitSplash1,
          backgroundimageurl: Assets.imagesBackgroundSplash1,
          colorbackground: Color(0xfffff5e3),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في'),
              Text(' HUB'),
              Text('Fruit'),
            ],
          ),
        ),
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          imageurl: Assets.imagesFruitSplash2,
          backgroundimageurl: Assets.imagesBackgroundSplash2,
          colorbackground: Color(0xffc9f0d9),
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ابحث وتسوق'),
            ],
          ),
        ),
      ],
    );
  }
}
