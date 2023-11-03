// import 'package:example1/controller/order_controller.dart';
// import 'package:example1/models/order_model.dart';
// import 'package:example1/utilites/colors.dart';
// import 'package:example1/utilites/dimension.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ViewOrder extends StatelessWidget {
//   final bool isCurrent;
//   const ViewOrder({Key? key, required this.isCurrent}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: GetBuilder<OrderController>(
//       builder: (OrderController) {
//         if (OrderController.isLoading == false) {
//           late List<OrderModel> orderList;
//           if (OrderController.currentOrderList.isNotEmpty) {
//             orderList = OrderController.currentOrderList.reversed.toList();
//             OrderController.historyOrderList.reversed.toList();
//           }
//           return SizedBox(
//             width: Dimension.screenWidth,
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Dimension.height10 / 2,
//                   vertical: Dimension.height10 / 2),
//               child: ListView.builder(
//                 itemCount: orderList.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () => null,
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                   "Order Id  #${orderList[index].id.toString()}"),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                       decoration: BoxDecoration(
//                                           color: AppColors.mainColor,
//                                           borderRadius: BorderRadius.circular(
//                                               Dimension.radius20 / 5)),
//                                       child: Container(
//                                           margin: EdgeInsets.all(
//                                               Dimension.height10 / 2),
//                                           child: Text(
//                                             "${orderList[index].orderStatus}",
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ))),
//                                   SizedBox(
//                                     height: Dimension.height10 / 2,
//                                   ),
//                                   InkWell(
//                                     onTap: () => null,
//                                     child: Container(
//                                        decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(
//                                               Dimension.radius20 / 5)),
//                                       child: Container(margin: EdgeInsets.all(Dimension.height10/2), child: Text("Track Order")),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Dimension.height10,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         } else {
//           return Text("data");
//         }
//       },
//     ));
//   }
// }
