
import 'package:agenda/application/modules/module.dart';
import 'package:agenda/modules/splash/splash_bindings.dart';
import 'package:agenda/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModules implements Module {
  @override
  List<GetPage> routes = [GetPage(name: '/', page: () => SplashPage(), binding: SplashBindings())];
}