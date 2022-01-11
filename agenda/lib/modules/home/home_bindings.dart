import 'package:agenda/modules/home/home_controller.dart';
import 'package:agenda/services/data_service.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(dataService: Get.find<DataService>()));
  }
}
