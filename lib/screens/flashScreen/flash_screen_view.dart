import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/widgets/custom_button.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {

  final storage = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height =  MediaQuery.of(context).size.height;
    double width =  MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(AppImages().flashBackground, fit: BoxFit.fill),
          ),
          SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: height * 0.20),
                  Image.asset(AppImages().flashLogo, height: height * 0.25, fit: BoxFit.fill),
                  const Text(
                    "A Holistic Learning App",
                    style: TextStyle(fontFamily: MEDULA_ONE_REGULAR, color: Color(0xFFFFA566), fontSize: 30),
                  ),
                  SizedBox(height: height * 0.10),
                  const Text(
                    "With More Than 700+ Videos And",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: INTER_MEDIUM,
                      color: Color(0xFF313131),
                    ),
                  ),
                  const Text(
                    "Activities To Learn From Each Year.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: INTER_MEDIUM,
                      color: Color(0xFF313131),
                    ),
                  ),
                  Container(padding: const EdgeInsets.symmetric(vertical: 10), child: Image.asset(AppImages().leafIcon, height: 20, fit: BoxFit.fill)),
                  const Text(
                    "Enhance Youre Creativity, Knowledge, Real Life",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: INTER_MEDIUM,
                      color: Color(0xFF313131),
                    ),
                  ),
                  const Text(
                    "Skills, Health And Happiness!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: INTER_MEDIUM,
                      color: Color(0xFF313131),
                    ),
                  ),
                  SizedBox(height: height * 0.15),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    margin: const EdgeInsets.only(bottom: 50),
                    height: 50,
                    child: CustomButton(
                      label: "GET STARTED",
                      labelColor: backgroundWhite,
                      borderColor: backgroundCyan,
                      buttonColor: backgroundCyan,
                      onTap: () {
                        if(storage.hasData(LOGIN_TRUE) && storage.read(LOGIN_TRUE) == true) {
                          Get.toNamed(Routes.HOME_SCREEN);
                        } else {
                          Get.toNamed(Routes.WELCOME_SCREEN);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
