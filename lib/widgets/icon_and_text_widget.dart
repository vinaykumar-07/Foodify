import 'package:example1/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});
  final IconData icon;
  final String text;

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
       const SizedBox(width: 10),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
