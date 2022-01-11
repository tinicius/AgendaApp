import 'package:agenda/repositories/data_repository.dart';
import 'package:agenda/services/data_service.dart';
import 'package:agenda/services/firebase_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DataRepository>(DataRepository(), permanent: true);
    Get.put<DataService>(FirebaseServiceImpl());
  }
}
