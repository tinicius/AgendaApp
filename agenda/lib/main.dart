import 'package:agenda/application/bindings/application_bindings.dart';
import 'package:agenda/application/theme/theme_config.dart';
import 'package:agenda/modules/edit/edit_module.dart';
import 'package:agenda/modules/home/home_module.dart';
import 'package:agenda/modules/splash/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApplicationBindings(),
      title: ThemeConfig.title,
      theme: ThemeConfig.theme,
      getPages: [
        ...SplashModules().routes,
        ...HomeModule().routes,
        ...EditModule().routes,
      ],
    );
  }
}
