
// import 'package:example1/data/repository/order_repo.dart';
// import 'package:example1/models/order_model.dart';
// import 'package:get/get.dart';

// class OrderController extends GetxController implements GetxService {
//   OrderRepo orderRepo;
//   OrderController({required this.orderRepo});
//   bool _isLoading = false;

//   late List<OrderModel> _currentOrderList;
//   late List<OrderModel> _historyOrderList;

//   bool get isLoading => _isLoading;
//   List<OrderModel> get currentOrderList => _currentOrderList;
//   List<OrderModel> get  historyOrderList => _historyOrderList;

//   Future<void> placeOrder(PlaceOrderBody placeOrder, Function callback) async {
//     _isLoading = true;
//     Response response = await OrderRepo.placeOrder(placeOrder);
//     if (response.statusCode == 200) {
//       _isLoading = false;
//       String message = response.body["message"];
//       String orderId = response.body["order_id"];
//       callback(true, message, orderId);
//     } else {
//       callback(false, response.statusText!, -1);
//     }
//     Future<void> getOrderList() async {
//       _isLoading = true;
//       Response response = await orderRepo.getOrderList();
//       if (response.statusCode == 200) {
//         _currentOrderList = [];
//         _historyOrderList = [];
//         response.body.forEach((order) {
//           OrderModel orderModel = OrderModel.fromJson(order);
//           if (orderModel.orderStatus == 'pending' ||
//               orderModel.orderStatus == 'accepted' ||
//               orderModel.orderStatus == 'picked_up' ||
//               orderModel.orderStatus == 'handover' ||
//               orderModel.orderStatus == 'processing') {
//             _currentOrderList.add(orderModel);
//           } else {
//             _historyOrderList.add(orderModel);
//           }
//         });
//       } else {
//         _currentOrderList = [];
//         _historyOrderList = [];
//       }
//       _isLoading = false;
//       update();
//     }
//   }
// }
 