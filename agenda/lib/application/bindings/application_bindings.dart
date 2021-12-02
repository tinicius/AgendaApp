import 'package:agenda/repositories/data_repository.dart';
import 'package:agenda/repositories/data_repository_impl.dart';
import 'package:agenda/services/data_service.dart';
import 'package:agenda/services/data_service_impl.dart';
import 'package:agenda/sqlite/sql_service.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SqlService()).init();
    Get.put<DataRepository>(DataRepositoryImpl(), permanent: true);
    Get.put<DataService>(DataServiceImpl(dataRepository: Get.find()),
        permanent: true);
  }
}
