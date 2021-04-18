import 'package:flutter/material.dart';

class IconView extends StatelessWidget {
  IconView({
    @required this.icon,
    this.iconColor = Colors.black,
    this.borderColor = Colors.black,
  });

  final IconData icon;
  final Color iconColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
      ),
      child: Icon(
        icon,
        size: 40,
        color: iconColor,
      ),
    );
  }
}
