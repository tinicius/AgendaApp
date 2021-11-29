import 'package:agenda/services/data_service.dart';
import 'package:get/get.dart';
import './detail_controller.dart';

class DetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController(dataService: Get.find<DataService>()));
  }
}
