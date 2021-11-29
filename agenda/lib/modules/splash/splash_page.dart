import 'package:agenda/application/theme/theme_config.dart';
import 'package:agenda/application/ui/widgets/logo.dart';
import 'package:agenda/application/ui/widgets/logomark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: ThemeConfig.blue1),
        width: Get.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //Logo
            Positioned(
              top: 200,
              child: Logo(
                height: 80,
                width: 80,
              ),
            ),

            //Assinatura
            Positioned(
              bottom: 10,
              child: LogoMark(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
