import 'package:agenda/application/ui/loader/loader_mixin.dart';
import 'package:agenda/models/contact_model.dart';
import 'package:agenda/services/data_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with LoaderMixin {
  final DataService _dataService;

  RxBool _isLoading = false.obs;

  var contatos = <ContactModel>[].obs;

  HomeController({required DataService dataService})
      : this._dataService = dataService;

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      loadContatos();
    } catch (e, s) {
      e.printInfo();
      s.printInfo();
    }
  }

  Future<void> loadContatos() async {
    final contacts = await _dataService.getContatos();
    contatos.assignAll(contacts);
   
  }

  void floatButtonOnClick() {
    Get.toNamed('/edit');
  }
}
