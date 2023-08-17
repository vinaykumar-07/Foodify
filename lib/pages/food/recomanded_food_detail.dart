import 'package:example1/controller/popular_product_controller.dart';
import 'package:example1/controller/recommended_food_controller.dart';
import 'package:example1/pages/cart/cart_page.dart';
import 'package:example1/routes/route_helper.dart';
import 'package:example1/utilites/app_constants.dart';
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/app_iocn.dart';
import 'package:example1/widgets/big_text.dart';
import 'package:example1/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().RecommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (page == "cartpage") {
                    Get.toNamed(RouteHelper.getCartPage());
                  } else {
                    Get.toNamed(RouteHelper.getInitial());
                  }
                },
                child: AppIcon(
                  icon: Icons.clear,
                  backgroundColor: Colors.white,
                ),
              ),
              GetBuilder<PopularProductController>(builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    if (controller.totelItem >= 1) {
                      Get.toNamed(RouteHelper.cartPage);
                    }
                  },
                  child: Stack(
                    children: [
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        backgroundColor: Colors.white,
                      ),
                      controller.totelItem >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                              ),
                            )
                          : Container(),
                      Get.find<PopularProductController>().totelItem >= 1
                          ? Positioned(
                              right: 5,
                              top: 4,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totelItem
                                    .toString(),
                                size: 12,
                                color: Colors.white,
                              ))
                          : Container(),
                    ],
                  ),
                );
              })
            ],
          ),
          expandedHeight: 300,
          pinned: true,
          bottom: PreferredSize(
            preferredSize: Size(double.maxFinite, 20),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimension.radius20),
                  topRight: Radius.circular(Dimension.radius20),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 10,
              ),
              child: Center(
                  child: BigText(size: Dimension.font26, text: product.name!)),
            ),
          ),
          backgroundColor: AppColors.yellowColor,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimension.width20, right: Dimension.width20),
                child: ExpandableTextWidget(text: product.description!),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimension.width20 * 2.5,
                  right: Dimension.width20 * 2.5,
                  top: Dimension.height10,
                  bottom: Dimension.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconSize: Dimension.iconsize24,
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ),
                    BigText(
                      text: "\$ ${product.price} X ${controller.inCartItem}",
                      color: AppColors.mainBackColor,
                      size: Dimension.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconSize: Dimension.iconsize24,
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Dimension.bottomHeightBar,
                padding: EdgeInsets.only(
                  top: Dimension.height30,
                  bottom: Dimension.width30,
                  left: Dimension.width20,
                  right: Dimension.width20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonbackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.radius20 * 2),
                      topRight: Radius.circular(Dimension.radius20 * 2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height20,
                          bottom: Dimension.height20,
                          right: Dimension.width20,
                          left: Dimension.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height20,
                          bottom: Dimension.height10,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controller.addItem(product);
                        },
                        child: BigText(
                          text: "\$ ${product.price!} | Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
