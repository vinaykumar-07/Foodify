import 'package:example1/pages/food/popular_food_detail.dart';
import 'package:example1/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../pages/food/recomanded_food_detail.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getinitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';



  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];

        return PopularFoodDetail(pageId: int.parse(pageId!),);
      },
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        print("Hey, Everything is runing well");
        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
