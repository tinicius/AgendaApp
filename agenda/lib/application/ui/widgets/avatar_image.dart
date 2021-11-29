import 'package:agenda/application/theme/theme_config.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final double radius;
  final String? imageUrl;

  const AvatarImage({Key? key, required this.radius, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Container(),
      backgroundColor: ThemeConfig.blue1,
      backgroundImage: imageUrl == null ? null : NetworkImage(imageUrl!),
    );
  }
}
