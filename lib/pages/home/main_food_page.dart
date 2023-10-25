import 'package:example1/controller/popular_product_controller.dart';
import 'package:example1/controller/recommended_food_controller.dart';
import 'package:example1/pages/home/food_page_body.dart';
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/big_text.dart';
import 'package:example1/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    // print("Current height is" + MediaQuery.of(context).size.height.toString());
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: _loadResources,
            child: Column(
              children: [
                // Showing the header content
                Container(
                  margin: EdgeInsets.only(
                      top: Dimension.height45, bottom: Dimension.height15),
                  padding: EdgeInsets.only(
                      left: Dimension.width20, right: Dimension.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(
                            text: "India",
                            color: AppColors.mainColor,
                            size: 30,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: "Lucknow",
                                color: Colors.black,
                              ),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Dimension.width45,
                          height: Dimension.height45,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius15),
                              color: AppColors.mainColor),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: Dimension.iconsize24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Showing the body content
                const Expanded(
                  child: SingleChildScrollView(
                    child: FoodPageBody(),
                  ),
                ),
              ],
            )));
  }
}
