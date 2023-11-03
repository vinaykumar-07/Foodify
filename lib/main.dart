import 'package:example1/controller/cart_controller.dart';
import 'package:example1/controller/popular_product_controller.dart';
import 'package:example1/controller/recommended_food_controller.dart';
import 'package:example1/pages/address/address_page.dart';
import 'package:example1/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/depandencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Delivery',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        //  home: const AddressPage(),
          initialRoute: RouteHelper.getsplach(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
