import 'package:example1/base/custom_loader.dart';
import 'package:example1/base/show_custom_snackbar.dart';
import 'package:example1/controller/auth_controller.dart';
import 'package:example1/pages/auth/sign_up_page.dart';
import 'package:example1/routes/route_helper.dart';
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/app_text_field.dart';
import 'package:example1/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackbar(
          "Type in your email",
          title: "Email",
        );
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar(
          "Type in your valid email address",
          title: "Invalid Email",
        );
      } else if (password.isEmpty) {
        showCustomSnackbar(
          "Type in your password",
          title: "Password",
        );
      } else if (password.length < 6) {
        showCustomSnackbar(
          "Password cannot be less than 6 character",
          title: "Weak Password",
        );
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            print("Success sign in");
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackbar(status.message);
          }
        });
        // print(signUpbody.toString());
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    SizedBox(
                      height: Dimension.screenHeight * 0.05,
                    ),

                    //logo
                    Container(
                      height: Dimension.screenHeight * 0.25,
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage:
                              AssetImage("assets/image/logo part 1.png"),
                        ),
                      ),
                    ),

                    //welcome page
                    Container(
                      margin: EdgeInsets.only(
                        left: Dimension.width20,
                      ),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              fontSize:
                                  Dimension.font20 * 3 + Dimension.font20 / 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Sign in to your account",
                            style: TextStyle(
                              fontSize: Dimension.font20,
                              color: Colors.grey[500],
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: Dimension.height20,
                    ),

                    AppTextField(
                      textController: emailController,
                      hintText: "Email",
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    AppTextField(
                      textController: passwordController,
                      hintText: "Password",
                      icon: Icons.password_sharp,
                       isObsecure: true,
                    ),

                    SizedBox(
                      height: Dimension.height20,
                    ),

                    Row(
                      children: [
                        Expanded(child: Container()),
                        RichText(
                          text: TextSpan(
                            text: "Sign into your account",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimension.font20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimension.width20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimension.screenHeight * 0.05,
                    ),

                    //sign in
                    GestureDetector(
                      onTap: (() {
                        _login(authController);
                      }),
                      child: Container(
                        width: Dimension.screenWidth / 2,
                        height: Dimension.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimension.radius30,
                          ),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: "Sign In",
                            size: Dimension.font20 + Dimension.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Dimension.screenHeight * 0.05,
                    ),

                    //sign up options
                    RichText(
                      text: TextSpan(
                          text: "Don\'t have an account?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimension.font20,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                      () => SignUpPage(),
                                      transition: Transition.fade,
                                    ),
                              text: "Create",
                              style: TextStyle(
                                color: AppColors.mainBackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimension.font20,
                              ),
                            ),
                          ]),
                    ),
                  ]),
                )
              : CustomLoder();
        }));
  }
}







/*
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller
  //  var AuthController authController;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackbar(
          "Type in your email",
          title: "Email",
        );
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar(
          "Type in your valid email address",
          title: "Invalid Email",
        );
      } else if (password.isEmpty) {
        showCustomSnackbar(
          "Type in your password",
          title: "Password",
        );
      } else if (password.length < 6) {
        showCustomSnackbar(
          "Password cannot be less than 6 character",
          title: "Weak Password",
        );
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            print("Success sign in");
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackbar(status.message);
          }
        });
        // print(signUpbody.toString());
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: Dimension.screenHeight * 0.05,
          ),
          Container(
            child: const Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: AssetImage("assets/image/logo part 1.png"),
              ),
            ),
          ),

          //welcome page
          Container(
            margin: EdgeInsets.only(
              left: Dimension.width20,
            ),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: Dimension.font20 * 3 + Dimension.font20 / 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in to your account",
                  style: TextStyle(
                    fontSize: Dimension.font20,
                    color: Colors.grey[500],
                    //fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimension.height20,
          ),

          AppTextField(
            textController: emailController,
            hintText: "Email",
            icon: Icons.email,
          ),
          SizedBox(
            height: Dimension.height20,
          ),
          AppTextField(
            textController: passwordController,
            hintText: "Password",
            icon: Icons.password_sharp,
            // isObscure: true,
          ),
          SizedBox(
            height: Dimension.height20,
          ),

          Row(
            children: [
              Expanded(child: Container()),
              RichText(
                text: TextSpan(
                  text: "Sign into your account",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimension.font20,
                  ),
                ),
              ),
              SizedBox(
                width: Dimension.width20,
              )
            ],
          ),
          SizedBox(
            height: Dimension.screenHeight * 0.05,
          ),

          //sign in
          GestureDetector(
            onTap: (() {
                _login(authController);
            }),
            child: Container(
              width: Dimension.screenWidth / 2,
              height: Dimension.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimension.radius30,
                ),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign In",
                  size: Dimension.font20 + Dimension.font20 / 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(
            height: Dimension.screenHeight * 0.05,
          ),

          //sign up options
          RichText(
            text: TextSpan(
                text: "Don\'t have an account?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimension.font20,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(
                            () => SignUpPage(),
                            transition: Transition.fade,
                          ),
                    text: "Create",
                    style: TextStyle(
                      color: AppColors.mainBackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimension.font20,
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
*/