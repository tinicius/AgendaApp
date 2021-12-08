import 'dart:io';

import 'package:agenda/application/theme/theme_config.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final double radius;
  final String? imageUrl;
  final ImageProvider? image;

  static setImage(imageUrl) {
    if (imageUrl == null) {
      return Image.asset(ThemeConfig.defaultImage, fit: BoxFit.fill).image;
    } else {
      if (imageUrl!.contains('assets')) {
        return Image.asset(imageUrl!, fit: BoxFit.fill).image;
      } else if (imageUrl!.contains('http')) {
        return Image.network(imageUrl!, fit: BoxFit.fill).image;
      } else {
        return Image.file(File(imageUrl!), fit: BoxFit.fill).image;
      }
    }
  }

  AvatarImage({Key? key, required this.radius, this.imageUrl})
      : image = setImage(imageUrl);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: image,
      backgroundColor: ThemeConfig.blue1,
    );
  }
}
