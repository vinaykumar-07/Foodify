import 'package:example1/base/show_custom_snackbar.dart';
import 'package:example1/controller/auth_controller.dart';
import 'package:example1/models/signup_body_model.dart';
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/app_text_field.dart';
import 'package:example1/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Controller

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // for validation while signup

      if (name.isEmpty) {
        showCustomSnackbar(
          "Type in your name",
          title: "Name",
        );
      } else if (phone.isEmpty) {
        showCustomSnackbar(
          "Type in your phone number",
          title: "Phone",
        );
      } else if (email.isEmpty) {
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
        showCustomSnackbar("All Went Well", title: "Perfect");
        SignupBody signUpbody = SignupBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        authController.registration(signUpbody).then((status) {
          if (status.isSuccess) {
            print("Success Registration");
          } else {
            showCustomSnackbar(status.message);
          }
        });
        print(signUpbody.toString());
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (_authController) {
            return !_authController.isLoading
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(children: [
                      SizedBox(
                        height: Dimension.screenHeight * 0.05,
                      ),
                      Container(
                        child: const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/image/logo part 1.png"),
                          ),
                        ),
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
                      AppTextField(
                          textController: nameController,
                          hintText: "Name",
                          icon: Icons.person),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      AppTextField(
                        textController: phoneController,
                        hintText: "Phone",
                        icon: Icons.phone,
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),

                      //sign up button
                      GestureDetector(
                        onTap: (() {
                          _registration(_authController);
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
                              text: "Sign Up",
                              size: Dimension.font20 + Dimension.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimension.height10,
                      ),

                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimension.font20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimension.screenHeight * 0.05,
                      ),

                      //sign up options
                      RichText(
                        text: TextSpan(
                          text: "Sign up using one of the following methods",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimension.font16,
                          ),
                        ),
                      ),

                      Wrap(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: Dimension.radius30,
                              backgroundImage: AssetImage(
                                  "assets/image/${signUpImages[index]}"),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                : CircularProgressIndicator();
          },
        ));
  }
}
