import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/app_iocn.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObsecure;
  AppTextField(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.icon,
      this.isObsecure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimension.height20, right: Dimension.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.radius15),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        controller: textController,
        obscureText: isObsecure ? true : false,
        decoration: InputDecoration(
          prefixIcon: AppIcon(
            backgroundColor: Colors.white,
            icon: icon,
            iconColor: AppColors.yellowColor,
          ),
          //Hint text
          hintText: hintText,
          //focus Border
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.radius15),
              borderSide: BorderSide(width: 1.0, color: Colors.white)),
          //enabled border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
