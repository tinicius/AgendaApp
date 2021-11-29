import 'package:agenda/application/ui/widgets/appbar_button.dart';
import 'package:agenda/modules/detail/widgets/detail_header.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dados pessoais'),
          actions: [
            AppbarButton(onTap: controller.edit, icon: Icons.edit),
            AppbarButton(onTap: controller.delete, icon: Icons.delete)
          ],
        ),
        body: Obx(
          () => Column(
            children: [
              DetailHeader(
                name: controller.contato.value?.name ?? '',
                phoneNumber: controller.contato.value?.phoneNumber ?? '',
                imageUrl: controller.contato.value?.profilePhotoUrl,
              ),
            ],
          ),
        ));
  }
}
