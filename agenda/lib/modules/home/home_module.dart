import 'package:agenda/application/modules/module.dart';
import 'package:agenda/modules/home/home_bindings.dart';
import 'package:agenda/modules/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routes = [GetPage(name: '/home', page: () => HomePage(), binding: HomeBindings())];

}