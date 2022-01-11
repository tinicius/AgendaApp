import 'package:agenda/application/theme/theme_config.dart';
import 'package:agenda/application/ui/widgets/avatar_image.dart';
import 'package:flutter/material.dart';

class AvatarEdit extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onPressed;

  const AvatarEdit({Key? key, this.imageUrl, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        
        AvatarImage(radius: 60, imageSource: imageUrl,),
        Material(
          shape: CircleBorder(),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          color: ThemeConfig.blue2,
          clipBehavior: Clip.antiAlias,
        )
      ],
    );
  }
}
