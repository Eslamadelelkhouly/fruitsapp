import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';
import 'package:fruitsapp/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 158,
      child: AspectRatio(
        aspectRatio: 342 / 151,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: width * 0.4,
              child: Image.asset(
                Assets.imagesFruitstest,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: width * 0.5,
              height: 158,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: svg.Svg(Assets.imagesFeatureitembackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 34,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'عروض العيد',
                      style: TextStyles.regular13.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'خصم 25%',
                      style: TextStyles.bold19.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    FeaturedItemButton(
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 29,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
