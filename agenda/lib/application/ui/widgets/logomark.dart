import 'package:flutter/material.dart';

class LogoMark extends StatelessWidget {
  final double fontSize;

  const LogoMark({Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'tinicius',
      style: TextStyle(fontSize: fontSize),
    );
  }
}
