import 'package:flutter/material.dart';
@immutable
class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;
  SmallText(
      {super.key,
      this.size = 12,
      this.height = 1.2,
      this.color = const Color(0xFFccc7c5),
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height
      ),
    );
  }
}
