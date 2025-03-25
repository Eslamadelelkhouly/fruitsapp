import 'package:flutter/material.dart';
import 'package:fruitsapp/core/utils/constants/app_text_style.dart';
import 'package:fruitsapp/core/utils/constants/color_app.dart';
import 'package:fruitsapp/core/utils/constants/imagesurl.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 165,
        height: 220,
        decoration: BoxDecoration(
          color: Color(0xffF3F5F7),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_outline),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    Assets.imagesFruitstripl,
                  ),
                  ListTile(
                    title: Text(
                      'فراولة',
                      style: TextStyles.bold16,
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '20جنية ',
                              style: TextStyles.bold13.copyWith(
                                color: ColorApp.koragne,
                              )),
                          TextSpan(
                            text: '/',
                            style: TextStyles.bold13.copyWith(
                              color: ColorApp.kOrange300,
                            ),
                          ),
                          TextSpan(
                            text: ' الكيلو',
                            style: TextStyles.bold13.copyWith(
                              color: ColorApp.kOrange300,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    trailing: CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorApp.kPrimaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
