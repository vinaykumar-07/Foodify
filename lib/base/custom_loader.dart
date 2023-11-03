
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:flutter/material.dart';


class CustomLoder extends StatelessWidget {
  const CustomLoder({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Container(
        height: Dimension.height20 * 5,
        width: Dimension.height20 * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.height20 * 5 / 2),
            color: AppColors.mainColor),
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
