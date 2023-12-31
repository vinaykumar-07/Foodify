import 'package:example1/controller/auth_controller.dart';
import 'package:example1/controller/cart_controller.dart';
import 'package:example1/controller/location_controller.dart';
import 'package:example1/controller/popular_product_controller.dart';
import 'package:example1/controller/recommended_food_controller.dart';
import 'package:example1/controller/user_controller.dart';
import 'package:example1/data/api/api_client.dart';
import 'package:example1/data/repository/auth_repo.dart';
import 'package:example1/data/repository/cart_repo.dart';
import 'package:example1/data/repository/location_repo.dart';
import 'package:example1/data/repository/popular_product_repo.dart';
import 'package:example1/data/repository/recommended_food_repo.dart';
import 'package:example1/data/repository/user_repo.dart';
import 'package:example1/utilites/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controller

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}