import 'dart:io';

import 'package:agenda/application/theme/theme_config.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final double radius;
  final String? imageUrl;

  const AvatarImage({Key? key, required this.radius, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image;

    if (imageUrl == null) {
      image = Image.asset(ThemeConfig.defaultImage).image;
    } else {
      if (imageUrl!.contains('assets')) {
        image = Image.asset(
          imageUrl!,
          fit: BoxFit.fill,
        ).image;
      } else {
        image = Image.file(File(imageUrl!), fit: BoxFit.fill).image;
      }
    }

    return CircleAvatar(
      radius: radius,
      backgroundImage: image,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
      ),
      backgroundColor: ThemeConfig.blue1,
    );
  }
}
