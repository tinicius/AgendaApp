import 'package:agenda/application/ui/widgets/avatar_image.dart';
import 'package:agenda/models/contact_model.dart';
import 'package:agenda/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactCard extends StatefulWidget {
  static const double RADIUS = 20;
  final color;

  static const DEAFULT_IMAGE = 'assets/images/github_logo.png';

  final ContactModel contato;

  ContactCard({required this.contato, this.color = Colors.white});

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  final HomeController homeController = Get.find<HomeController>();

  Rx<bool> hasError = false.obs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.color,
      leading: AvatarImage(
        radius: ContactCard.RADIUS,
        imageUrl: widget.contato.profilePhotoUrl,
      ),
      trailing: InkWell(
        onTap: () {
          Get.toNamed(
            '/detail',
            arguments: widget.contato.id,
          );
        },
        customBorder: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.visibility),
        ),
      ),
      title: Text(
        widget.contato.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        widget.contato.phoneNumber,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
