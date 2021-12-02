import 'package:agenda/application/theme/theme_config.dart';
import 'package:agenda/application/ui/messages/messages_mixin.dart';
import 'package:agenda/models/contact_model.dart';
import 'package:agenda/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController with MessagesMixin {
  final DataService _dataService;
  String? id;

  Rxn<ContactModel> contato = Rxn<ContactModel>();

  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  RxBool isloading = false.obs;

  Rxn<MessageModel> message = Rxn<MessageModel>();

  EditController({required DataService dataService})
      : _dataService = dataService;

  @override
  void onInit() {
    //Recebendo o id do perfil a ser editado, nulo caso seja a criação de um novo perfil
    id = Get.arguments;

    //Inicializando o listener de avisos
    messageListener(message);

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    if (this.id != null) {
      contato(await _dataService.getContatoById(Get.arguments));
      nameController.text = contato.value!.name;
      phoneController.text = contato.value!.phoneNumber;
    }

    super.onReady();
  }

  void formOnChanged() {
    formKey.currentState!.validate();
  }

  Future<void> formButtonOnClick() async {
    isloading(true);
    bool result = false;

    if (formKey.currentState!.validate()) {
      if (contato.value != null) {
        ContactModel newContato = ContactModel(
            profilePhotoUrl: contato.value!.profilePhotoUrl,
            name: nameController.text,
            phoneNumber: phoneController.text,
            id: id);

        await _dataService.editContato(newContato);
        isloading(false);
        Get.offAllNamed('/home');
      } else {
        ContactModel newContato = ContactModel(
          profilePhotoUrl: ThemeConfig.defaultImage,
          name: nameController.text,
          phoneNumber: phoneController.text,
        );

        result = await _dataService.saveContato(newContato);
        isloading(false);
        Get.offAllNamed('/home');
      }
    }

    if (result) {
      message.value =
          MessageModel.info(title: 'Parabéns', message: 'Contato salvo!');
    } else {
      isloading(false);
    }
  }
}
