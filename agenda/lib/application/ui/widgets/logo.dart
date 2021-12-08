import 'package:agenda/application/theme/theme_config.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;
  final double width;

  const Logo({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeConfig.red,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      height: height,
      width: width,
    );
  }
}
