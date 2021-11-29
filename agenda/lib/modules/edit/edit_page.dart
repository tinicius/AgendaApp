import 'package:agenda/modules/edit/widgets/avatar_edit.dart';
import 'package:agenda/modules/edit/widgets/text_input.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './edit_controller.dart';

class EditPage extends GetView<EditController> {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
      ),
      body: SizedBox(
        width: Get.width,
        child: Obx(() {
          return Form(
            key: controller.formKey,
            onChanged: controller.formOnChanged,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AvatarEdit(
                    imageUrl: controller.contato.value?.profilePhotoUrl,
                  ),
                ),
                Divider(),
                TextInput(
                  labelText: 'Nome',
                  controller: controller.nameController,
                ),
                TextInput(
                  labelText: 'Telefone',
                  controller: controller.phoneController,
                ),
                Divider(),
                (!controller.isloading.value)
                    ? TextButton(
                        onPressed: controller.formButtonOnClick,
                        child: Text('Confirmar'))
                    : CircularProgressIndicator()
              ],
            ),
          );
        }),
      ),
    );
  }
}
