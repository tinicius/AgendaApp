import 'package:agenda/application/ui/widgets/avatar_image.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader(
      {Key? key, this.imageUrl, required this.name, required this.phoneNumber})
      : super(key: key);

  static const double RADIUS = 60;
  static const double SPACE = 5;

  final String? imageUrl;
  final String name;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2.0,
        color: Colors.grey[400],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  child: AvatarImage(
                    radius: RADIUS,
                    imageSource: imageUrl,
                  )),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 8),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
