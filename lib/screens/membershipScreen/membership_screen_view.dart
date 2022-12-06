import 'package:flutter/material.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';

class MembershipScreenView extends StatefulWidget {
  const MembershipScreenView({Key? key}) : super(key: key);

  @override
  State<MembershipScreenView> createState() => _MembershipScreenViewState();
}

class _MembershipScreenViewState extends State<MembershipScreenView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundCyan,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(width: width, child: Image.asset(AppImages().subscriptionBackground1, fit: BoxFit.fill)),
          Container(
            margin: EdgeInsets.only(top: height * 0.25),
            width: width,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: backgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Image.asset(AppImages().subscriptionBackground2, fit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 75),
            height: height,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.25 - 50,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Image.asset(AppImages().drawerIcon, fit: BoxFit.fill, scale: 2.5), Image.asset(AppImages().profileIcon, fit: BoxFit.fill, scale: 3)],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.05),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Become A Member",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 30, color: backgroundWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(20),
                  height: height * 0.45,
                  decoration: const BoxDecoration(
                    color: lightCyanBackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PLAN NAME",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: ROBOTO_BOLD,
                            color: backgroundCyan,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "\$109",
                          style: TextStyle(fontSize: 30, fontFamily: ROBOTO_BOLD, color: backgroundCyan),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              margin: const EdgeInsets.only(top: 5, right: 10),
                              decoration: const BoxDecoration(color: textBlack, shape: BoxShape.circle),
                            ),
                            const Expanded(
                              child: Text(
                                "Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontFamily: ROBOTO_REGULAR, color: textBlack),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              margin: const EdgeInsets.only(top: 5, right: 10),
                              decoration: const BoxDecoration(color: textBlack, shape: BoxShape.circle),
                            ),
                            const Expanded(
                              child: Text(
                                "Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontFamily: ROBOTO_REGULAR, color: textBlack),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              margin: const EdgeInsets.only(top: 5, right: 10),
                              decoration: const BoxDecoration(color: textBlack, shape: BoxShape.circle),
                            ),
                            const Expanded(
                              child: Text(
                                "Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontFamily: ROBOTO_REGULAR, color: textBlack),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              margin: const EdgeInsets.only(top: 5, right: 10),
                              decoration: const BoxDecoration(color: textBlack, shape: BoxShape.circle),
                            ),
                            const Expanded(
                              child: Text(
                                "Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontFamily: ROBOTO_REGULAR, color: textBlack),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.CATEGORY_SCREEN);
                          },
                          child: Container(
                            width: width * 0.40,
                            alignment: Alignment.center,
                            height: 35,
                            decoration: const BoxDecoration(color: backgroundCyan, borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: const Text(
                              "Purchase",
                              style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: backgroundWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
