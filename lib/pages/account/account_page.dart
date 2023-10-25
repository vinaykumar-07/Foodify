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
/*
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: 'Profile',
            size: 24,
            color: Colors.white,
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: Dimension.height20),
          child: Column(
            children: [
              // Profile Icon
              AppIcon(
                icon: Icons.person,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimension.height15 * 5,
                size: Dimension.height15 * 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Name
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimension.height15 * 2,
                          size: Dimension.height15 * 10 / 3,
                        ),
                        bigText: BigText(text: 'Vinay'),
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      //Phone
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimension.height15 * 2,
                          size: Dimension.height15 * 10 / 3,
                        ),
                        bigText: BigText(text: '6393116545'),
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      //Email
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email_outlined,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimension.height15 * 2,
                          size: Dimension.height15 * 10 / 3,
                        ),
                        bigText: BigText(text: 'vinay29kum@gmail.com'),
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      //Address
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimension.height15 * 2,
                          size: Dimension.height15 * 10 / 3,
                        ),
                        bigText: BigText(text: 'Fill in your Addresss'),
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      //Message
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message,
                          iconColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          iconSize: Dimension.height15 * 2,
                          size: Dimension.height15 * 10 / 3,
                        ),
                        bigText: BigText(text: 'Message'),
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      //logout
                      GestureDetector(
                        onTap: () {
                          // if (Get.find<AuthController>().userLoggedIn()) {
                          //   Get.find<AuthController>().clearSharedData();
                          //   Get.find<CartController>().clear();
                          //   Get.find<CartController>().clearCartHistory();
                          // } else {
                          //   Get.offNamed(RouteHelper.getInitial());
                          //   print("you logged out");
                          // }
                        },
                        child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout_outlined,
                            iconColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                            iconSize: Dimension.height15 * 2,
                            size: Dimension.height15 * 10 / 3,
                          ),
                          bigText: BigText(text: 'LogOut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        //     : Container(
        //         child: Text("you must have to logged in first"),
        //       ))
        // : CustomLoder();
        // }
        );
  }
}
*/

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: 'Profile',
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(top: Dimension.height20),
                      child: Column(
                        children: [
                          // Profile Icon
                          AppIcon(
                            icon: Icons.person,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            iconSize: Dimension.height15 * 5,
                            size: Dimension.height15 * 10,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //Name
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      iconColor: Colors.white,
                                      backgroundColor: AppColors.mainColor,
                                      iconSize: Dimension.height15 * 2,
                                      size: Dimension.height15 * 10 / 3,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel!.name),
                                  ),
                                  SizedBox(
                                    height: Dimension.height20,
                                  ),
                                  //Phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      iconColor: Colors.white,
                                      backgroundColor: AppColors.yellowColor,
                                      iconSize: Dimension.height15 * 2,
                                      size: Dimension.height15 * 10 / 3,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel!.phone),
                                  ),
                                  SizedBox(
                                    height: Dimension.height20,
                                  ),
                                  //Email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email_outlined,
                                      iconColor: Colors.white,
                                      backgroundColor: AppColors.yellowColor,
                                      iconSize: Dimension.height15 * 2,
                                      size: Dimension.height15 * 10 / 3,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel!.email),
                                  ),
                                  SizedBox(
                                    height: Dimension.height20,
                                  ),
                                  //Address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      iconColor: Colors.white,
                                      backgroundColor: AppColors.yellowColor,
                                      iconSize: Dimension.height15 * 2,
                                      size: Dimension.height15 * 10 / 3,
                                    ),
                                    bigText:
                                        BigText(text: 'Fill in your Addresss'),
                                  ),
                                  SizedBox(
                                    height: Dimension.height20,
                                  ),
                                  //Message
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message,
                                      iconColor: Colors.white,
                                      backgroundColor: Colors.redAccent,
                                      iconSize: Dimension.height15 * 2,
                                      size: Dimension.height15 * 10 / 3,
                                    ),
                                    bigText: BigText(text: 'Message'),
                                  ),
                                  SizedBox(
                                    height: Dimension.height20,
                                  ),
                                  //logout
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                      } else {
                                        Get.offNamed(RouteHelper.getInitial());
                                        print("you logged out");
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout_outlined,
                                        iconColor: Colors.white,
                                        backgroundColor: Colors.redAccent,
                                        iconSize: Dimension.height15 * 2,
                                        size: Dimension.height15 * 10 / 3,
                                      ),
                                      bigText: BigText(text: 'LogOut'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text("you must have to logged in first  "),
                      ),
                    ))
              : CustomLoder();
        }));
  }
}
