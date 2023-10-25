import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/app_iocn.dart';
import 'package:example1/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AccountWidget({super.key, required this.appIcon, required this.bigText});
  AppIcon appIcon;
  BigText bigText;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: Dimension.height20,
            top: Dimension.height10,
            bottom: Dimension.height10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 1),
        ]),
        child: Row(
          children: [
            appIcon,
            SizedBox(
              width: Dimension.height20,
            ),
            bigText
          ],
        ));
  }
}
