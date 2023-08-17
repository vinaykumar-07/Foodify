import 'package:example1/pages/cart/cart_page.dart';
import 'package:example1/pages/food/popular_food_detail.dart';
import 'package:example1/pages/home/home_page.dart';
import 'package:example1/pages/splach/splash_page.dart';
import 'package:get/get.dart';
import '../pages/food/recomanded_food_detail.dart';

class RouteHelper {
//  define Route Variables

  static const String splachPage = '/splach-page';
  static const String initial = '/';
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

// Route Methods
  static String getsplach() => '$splachPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [

    GetPage(name: splachPage, page: ()=>SplachScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];

        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        // print("Hey, Everything is runing well");
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: '',
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    )
  ];
}
