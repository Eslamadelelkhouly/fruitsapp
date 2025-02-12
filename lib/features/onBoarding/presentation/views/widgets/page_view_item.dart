import 'package:flutter/material.dart';

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
    return const Placeholder();
  }
}
