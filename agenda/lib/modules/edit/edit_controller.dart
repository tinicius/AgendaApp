import 'package:agenda/application/theme/theme_config.dart';
import 'package:agenda/application/ui/messages/messages_mixin.dart';
import 'package:agenda/models/contact_model.dart';
import 'package:agenda/repositories/data_repository.dart';
import 'package:agenda/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditController extends GetxController with MessagesMixin {
  final DataRepository _dataRepository;
  final ImagePicker _imagePicker = ImagePicker();

  Rxn<ContactModel> contato = Rxn<ContactModel>();
  String? id;

  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  Rxn<String> imageController = Rxn<String>(ThemeConfig.defaultImage);
  RxBool isloading = false.obs;

  Rxn<MessageModel> message = Rxn<MessageModel>();

  EditController({required DataRepository dataRepository})
      : _dataRepository = dataRepository;

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
      contato(await _dataRepository.getContatoById(Get.arguments));
      nameController.text = contato.value!.name;
      phoneController.text = contato.value!.phoneNumber;
      imageController.value = contato.value!.profilePhotoUrl;
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

        await _dataRepository.editContato(newContato);

        isloading(false);

        Get.offAllNamed('/home');
      } else {
        ContactModel newContato = ContactModel(
          profilePhotoUrl: imageController.value!,
          name: nameController.text,
          phoneNumber: phoneController.text,
        );

        await _dataRepository.addContato(newContato);

        isloading(false);

        Get.offAllNamed('/home');
      }
    }
  }

  Future<void> editPhotoButtomClick() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      imageController.value = image?.path;
      contato.value?.profilePhotoUrl = imageController.value!;
    } catch (e) {}
  }
}
