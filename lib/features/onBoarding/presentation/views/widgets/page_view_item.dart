import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.imageurl,
      required this.backgroundimageurl,
      required this.subtitle,
      required this.title});
  final String imageurl, backgroundimageurl, subtitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundimageurl,
                  color: Color(0xfffff5e3),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(imageurl),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('تخط'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
