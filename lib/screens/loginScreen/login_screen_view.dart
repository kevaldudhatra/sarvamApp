import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/screens/loginScreen/login_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscuredText = true;
  bool isChecked = false;
  final storage = GetStorage();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RegExp isValidEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  LoginScreenController loginScreenController = Get.put(LoginScreenController());

  void passwordHideShow() {
    setState(() {
      obscuredText = !obscuredText;
    });
  }

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
                            "Log In",
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
                            "Email Address",
                            style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                          ),
                          const SizedBox(height: 5),
                          CustomTextField(
                            textEditingController: email,
                            maxLine: 1,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            hint: "example@gmail.com",
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Password",
                            style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                          ),
                          const SizedBox(height: 5),
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              CustomTextField(
                                textEditingController: password,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                contentPaddingRight: 50,
                                maxLine: 1,
                                hint: "**********",
                                obscureText: obscuredText,
                              ),
                              Positioned(
                                right: 15,
                                child: GestureDetector(onTap: passwordHideShow, child: Icon(obscuredText ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: Colors.black, size: 18)),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                    value: isChecked,
                                    checkColor: textBlack,
                                    activeColor: backgroundWhite,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    }),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "Remember",
                                style: TextStyle(fontSize: 14, fontFamily: ROBOTO_MEDIUM, color: backgroundWhite),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.FORGOT_PASSWORD_SCREEN);
                                },
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(fontSize: 14, fontFamily: ROBOTO_MEDIUM, color: backgroundWhite, decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 50),
                            height: 50,
                            child: CustomButton(
                              label: "LOG IN",
                              labelColor: backgroundWhite,
                              borderColor: Colors.white,
                              buttonColor: Colors.transparent,
                              onTap: () async {
                                if (email.text.toString().isEmpty) {
                                  Get.snackbar("Oops!", "Email required!", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else if (!isValidEmail.hasMatch(email.text.toString())) {
                                  Get.snackbar("Oops!", "Enter valid email address!", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else if (password.text.toString().isEmpty || password.text.length < 6) {
                                  Get.snackbar("Oops!", "You have to enter at least 6 digit password!", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else {
                                  await loginScreenController.logIn(email.text.trim().toString(), password.text.trim().toString());
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
