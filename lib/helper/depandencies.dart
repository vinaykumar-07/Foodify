import 'package:example1/controller/cart_controller.dart';
import 'package:example1/controller/popular_product_controller.dart';
import 'package:example1/controller/recommended_food_controller.dart';
import 'package:example1/data/api/api_client.dart';
import 'package:example1/data/repository/cart_repo.dart';
import 'package:example1/data/repository/popular_product_repo.dart';
import 'package:example1/data/repository/recommended_food_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // AppiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));

// Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}




















// import 'package:example1/data/api/api_client.dart';
// import 'package:example1/data/repository/popular_product_repo.dart';
// import 'package:example1/utilites/app_constants.dart';
// import 'package:get/get.dart';
// import '../controller/popular_product_controller.dart';

// Future<void> init() async {
//   // Api Client
//   Get.lazyPut(
//     () => ApiClient(appBaseUrl:AppConstants.BASE_URL )
//   );

//   // Repo
//   Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

//   // Controller
//   Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
// }
