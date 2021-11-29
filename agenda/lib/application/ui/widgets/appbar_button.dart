import 'package:flutter/material.dart';

class AppbarButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const AppbarButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
      ),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
    );
  }
}
