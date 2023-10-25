import 'package:example1/base/custom_loader.dart';
import 'package:example1/controller/auth_controller.dart';
import 'package:example1/controller/cart_controller.dart';
import 'package:example1/controller/user_controller.dart';
import 'package:example1/routes/route_helper.dart';
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/account_widget.dart';
import 'package:example1/widgets/app_iocn.dart';
import 'package:example1/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("User has logged in");
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Center(
            child: BigText(
              text: "Profile",
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: GetBuilder<UserController>(
          builder: (userController) {
            return _userLoggedIn
                ? (userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimension.height20),
                        child: Column(
                          children: [
                            //profile icon
                            AppIcon(
                              icon: Icons.person,
                              backgroundColor: AppColors.mainColor,
                              iconColor: Colors.white,
                              iconSize: Dimension.height30 + Dimension.height45,
                              size: Dimension.height15 * 10,
                            ),
                            SizedBox(
                              height: Dimension.height30,
                            ),

                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    //name
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.person,
                                        backgroundColor: AppColors.mainColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimension.height10 * 5 / 2,
                                        size: Dimension.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text: userController.userModel!.name),
                                    ),
                                    SizedBox(
                                      height: Dimension.height20,
                                    ),

                                    //phone
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.phone,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimension.height10 * 5 / 2,
                                        size: Dimension.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text:
                                              userController.userModel!.phone),
                                    ),
                                    SizedBox(
                                      height: Dimension.height20,
                                    ),

                                    //email
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.email,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimension.height10 * 5 / 2,
                                        size: Dimension.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text:
                                              userController.userModel!.email),
                                    ),
                                    SizedBox(
                                      height: Dimension.height20,
                                    ),

                                    //address
                                    AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.location_on,
                                        backgroundColor: AppColors.mainColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimension.height10 * 5 / 2,
                                        size: Dimension.height10 * 5,
                                      ),
                                      bigText:
                                          BigText(text: "Fill your address"),
                                    ),
                                    SizedBox(
                                      height: Dimension.height20,
                                    ),

                                    //log out

                                    GestureDetector(
                                      onTap: (() {
                                        if (Get.find<AuthController>()
                                            .userLoggedIn()) {
                                          Get.find<AuthController>()
                                              .clearSharedData();
                                          Get.find<CartController>().clear();
                                          Get.find<CartController>()
                                              .clearCartHistory();
                                          Get.offNamed(
                                              RouteHelper.getSignInPage());
                                        }
                                      }),
                                      child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.logout,
                                          backgroundColor: Colors.redAccent,
                                          iconColor: Colors.white,
                                          iconSize: Dimension.height10 * 5 / 2,
                                          size: Dimension.height10 * 5,
                                        ),
                                        bigText: BigText(text: "Logout"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : CustomLoder())
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: Dimension.height10 * 18,
                            margin: EdgeInsets.only(
                                left: Dimension.width20,
                                right: Dimension.width20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/signintocontinue.png"),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (() {
                              Get.toNamed(RouteHelper.getSignInPage());
                            }),
                            child: Container(
                              width: double.maxFinite,
                              height: Dimension.height20 * 5,
                              margin: EdgeInsets.only(
                                  left: Dimension.width20,
                                  right: Dimension.width20),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20),
                              ),
                              child: Center(
                                child: BigText(
                                  text: "Sign In",
                                  color: Colors.white,
                                  size: Dimension.font26,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
