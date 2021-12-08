import 'dart:io';

import 'package:agenda/application/theme/theme_config.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final double radius;
  final String? imageSource;
  final ImageProvider? image;

  static setImage(imageSource) {
    if (imageSource == null) {
      return Image.asset(ThemeConfig.defaultImage, fit: BoxFit.fill).image;
    } else {
      if (imageSource!.contains('assets')) {
        return Image.asset(imageSource!, fit: BoxFit.fill).image;
      } else if (imageSource!.contains('http')) {
        return Image.network(imageSource!, fit: BoxFit.fill).image;
      } else {
        return Image.file(File(imageSource!), fit: BoxFit.fill).image;
      }
    }
  }

  AvatarImage({Key? key, required this.radius, this.imageSource})
      : image = setImage(imageSource);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: image,
      backgroundColor: ThemeConfig.blue1,
    );
  }
}
