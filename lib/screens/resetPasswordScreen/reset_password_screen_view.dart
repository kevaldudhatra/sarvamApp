import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/screens/resetPasswordScreen/reset_password_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final storage = GetStorage();
  final args = Get.arguments;
  TextEditingController otp = TextEditingController();
  TextEditingController password = TextEditingController();
  ResetPasswordScreenController resetPasswordScreenController = Get.put(ResetPasswordScreenController());

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            "Reset Password",
                            style: TextStyle(color: backgroundCyan, fontSize: 25, fontFamily: ROBOTO_BOLD),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Otp",
                            style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                          ),
                          const SizedBox(height: 5),
                          CustomTextField(
                            maxLine: 1,
                            textEditingController: otp,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            hint: "Enter otp",
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Password",
                            style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                          ),
                          const SizedBox(height: 5),
                          CustomTextField(
                            textEditingController: password,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLine: 1,
                            hint: "Enter new password",
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 50),
                            height: 50,
                            child: CustomButton(
                              label: "RESET PASSWORD",
                              labelColor: backgroundWhite,
                              borderColor: Colors.white,
                              buttonColor: Colors.transparent,
                              onTap: () async {
                                if (otp.text.toString().isEmpty) {
                                  Get.snackbar("Oops!", "Otp required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else if (password.text.toString().isEmpty || password.text.length < 6) {
                                  Get.snackbar("Oops!", "You have to enter at least 6 digit password!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else {
                                  resetPasswordScreenController.resetPassword(args[0], args[1], otp.text.trim().toString(), password.text.trim().toString());
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
