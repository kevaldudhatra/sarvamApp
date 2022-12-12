import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarvam/screens/forgotPasswordScreen/forgot_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordScreenController forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(height: height, width: width, child: Image.asset(AppImages().loginBackground, fit: BoxFit.fill)),
              SizedBox(
                height: height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Image.asset(AppImages().backArrow, scale: 3.0),
                              padding: const EdgeInsets.symmetric(horizontal: 20)),
                          const Text(
                            "Forgot Password",
                            style: TextStyle(color: backgroundCyan, fontSize: 25, fontFamily: ROBOTO_BOLD),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height * 0.50),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Email Address",
                            style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                          ),
                          const SizedBox(height: 5),
                          CustomTextField(
                            textEditingController: email,
                            keyboardType: TextInputType.emailAddress,
                            hint: "example@gmail.com",
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 50),
                            height: 50,
                            child: CustomButton(
                              label: "SEND",
                              labelColor: backgroundWhite,
                              borderColor: Colors.white,
                              buttonColor: Colors.transparent,
                              onTap: () {
                                if (email.text.toString().isEmpty) {
                                  Get.snackbar("Oops!", "Email required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else {
                                  forgotPasswordScreenController.forgotPassword(email.text.trim().toString());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
