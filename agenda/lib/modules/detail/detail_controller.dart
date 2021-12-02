import 'package:agenda/application/ui/loader/loader_mixin.dart';
import 'package:agenda/application/ui/messages/delete_dialog.dart';
import 'package:agenda/application/ui/messages/messages_mixin.dart';
import 'package:agenda/models/contact_model.dart';
import 'package:agenda/services/data_service.dart';
import 'package:get/get.dart';

class DetailController extends GetxController
    with LoaderMixin, MessagesMixin, DeleteDialog {
  final Rxn<ContactModel> contato = Rxn<ContactModel>();
  final DataService _dataService;

  String? id;

  RxBool _loading = false.obs;
  Rxn<MessageModel> message = Rxn<MessageModel>();

  DetailController({required DataService dataService})
      : _dataService = dataService;

  @override
  void onInit() {
    super.onInit();

    id = Get.arguments;
    loaderListener(_loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      _loading(true);

      String id = this.id!;

      final contatoData = await _dataService.getContatoById(id);
      contato(contatoData);

      _loading(false);
    } catch (e, s) {
      e.printInfo();
      s.printInfo();
      _loading(false);
    }
  }

  void onBack() {
    print('Voltar');
    Get.back();
  }

  void onDelet() {
    _dataService.deleteContato(contato.value!.id!);
    Get.back();
    Get.offAllNamed('/home');
  }

  void edit() {
    Get.toNamed('/edit', arguments: contato.value!.id);
  }

  void delete() {
    showDialog(onBack, onDelet);
  }
}
