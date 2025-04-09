import 'package:fruitsapp/core/utils/constants/imagesurl.dart';

class BottomNavigationBarEntity {
  final String ActiveImage, NoActiveImage;
  final String text;

  BottomNavigationBarEntity(
      {required this.ActiveImage,
      required this.NoActiveImage,
      required this.text});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItem => [
      BottomNavigationBarEntity(
        ActiveImage: Assets.imagesHomeInteractive,
        NoActiveImage: Assets.imagesHomeNointeracive,
        text: 'الرئيسية',
      ),
      BottomNavigationBarEntity(
        ActiveImage: Assets.imagesProductInteractive,
        NoActiveImage: Assets.imagesProductLogoNointeractive,
        text: 'المنتجات',
      ),
      BottomNavigationBarEntity(
        ActiveImage: Assets.imagesShoppingCartInteractive,
        NoActiveImage: Assets.imagesShoppingCartNointeracive,
        text: 'سلة التسوق',
      ),
      BottomNavigationBarEntity(
        ActiveImage: Assets.imagesUserInteracive,
        NoActiveImage: Assets.imagesUserNointeracive,
        text: 'حسابي',
      ),
    ];
