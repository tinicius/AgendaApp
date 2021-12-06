import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static Color red = Color.fromRGBO(230, 57, 70, 1);
  static Color green = Color.fromRGBO(241, 250, 238, 1);
  static Color lightBlue = Color.fromRGBO(168, 218, 220, 1);
  static Color blue1 = Color.fromRGBO(69, 123, 157, 1);
  static Color blue2 = Color.fromRGBO(29, 53, 87, 1);

  static String get title => 'Agenda';
  static String get defaultImage =>
      'assets/images/github_logo.png';

  static ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeConfig.blue2,
      ));
}
