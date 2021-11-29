import 'package:agenda/application/modules/module.dart';
import 'package:agenda/modules/edit/edit_bindings.dart';
import 'package:agenda/modules/edit/edit_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class EditModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(name: '/edit', page: () => EditPage(), binding: EditBindings())
  ];
}
