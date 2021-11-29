import 'package:get/get.dart';
import './edit_controller.dart';

class EditBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EditController(dataService: Get.find()));
  }
}
