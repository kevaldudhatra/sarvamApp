import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(AppImages().welcomeBackground, fit: BoxFit.fill),
          ),
          SizedBox(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.20),
                  child: Image.asset(AppImages().flashLogo, scale: 4.0),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 50,
                      width: 250,
                      child: CustomButton(
                        label: "LOG IN",
                        labelColor: backgroundCyan,
                        borderColor: Colors.white,
                        buttonColor: backgroundWhite,
                        onTap: () {
                          Get.toNamed(Routes.LOGIN_SCREEN);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      height: 50,
                      width: 250,
                      child: CustomButton(
                        label: "SIGN UP",
                        labelColor: backgroundWhite,
                        borderColor: Colors.white,
                        buttonColor: Colors.transparent,
                        onTap: () {
                          Get.toNamed(Routes.REGISTER_SCREEN);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
