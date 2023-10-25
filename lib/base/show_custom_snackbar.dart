// import 'package:example1/widgets/big_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void showCustomSnackbar(String message,Color? color,

//     {bool isError = true, String title = "Error"}) {
//   Get.snackbar(title, message,
//       titleText: BigText(
//         text: title,
//         color: Colors.white,
//       ),
//       messageText: Text(
//         message,
//         style: TextStyle(color: Colors.white),
//       ),
//       colorText: Colors.white,
//       snackPosition: SnackPosition.TOP,
//       backgroundColor: color??Colors.redAccent);
// }
// // TODO Implement this library.

import 'package:example1/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String message,
    {Color? color, bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigText(
      text: title,
      color: Colors.white,
    ),
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: color ?? Colors.redAccent,
  );
}
