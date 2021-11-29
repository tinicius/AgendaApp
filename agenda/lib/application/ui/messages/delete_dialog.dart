import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DeleteDialog on GetxController {
  void showDialog(VoidCallback onBack, VoidCallback onDelete) {
    Get.dialog(
      Center(
        child: Container(
          child: AlertDialog(
            title: Text('Tem certeza que deseja deletar esse contato?'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: onBack, child: Text('Voltar')),
                TextButton(
                    onPressed: onDelete,
                    child: Text(
                      'Apagar',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
