import 'package:agenda/application/modules/module.dart';
import 'package:agenda/modules/detail/detail_bindings.dart';
import 'package:agenda/modules/detail/detail_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class DetailModules implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
        name: '/detail', page: () => DetailPage(), binding: DetailBindings(),),
  ];
}
