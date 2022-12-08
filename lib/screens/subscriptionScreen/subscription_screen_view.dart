import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';

class SubscriptionScreenView extends StatefulWidget {
  const SubscriptionScreenView({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreenView> createState() => _SubscriptionScreenViewState();
}

class _SubscriptionScreenViewState extends State<SubscriptionScreenView> {
  final storage = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(width: width, child: Image.asset(AppImages().subscriptionBackground1, fit: BoxFit.fill)),
          Container(
            margin: EdgeInsets.only(top: height * 0.25, bottom: 20),
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
                        children: [
                          Image.asset(AppImages().drawerIcon, fit: BoxFit.fill, scale: 2.5),
                          InkWell(
                              onTap: () {
                                storage.erase();
                                Get.toNamed(Routes.WELCOME_SCREEN);
                              },
                              child: Image.asset(AppImages().profileIcon, fit: BoxFit.fill, scale: 3))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.05),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Subscription",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 30, color: backgroundWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: height * 0.75 - 115,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.28,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: backgroundCyan,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.13,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "FREE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: ROBOTO_MEDIUM,
                                          color: backgroundWhite,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Image.asset(AppImages().dashedLineIcon, width: 55)
                                    ],
                                  ),
                                  const Text(
                                    "\$0",
                                    style: TextStyle(fontSize: 30, fontFamily: ROBOTO_BOLD, color: backgroundWhite),
                                  ),
                                  const Text(
                                    "Every 6 Months",
                                    style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(AppImages().dividerIcon, height: height * 0.02, width: 150, fit: BoxFit.fitWidth),
                            Container(
                              height: height * 0.13,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 5,
                                            width: 5,
                                            margin: const EdgeInsets.only(right: 5),
                                            decoration: const BoxDecoration(color: backgroundWhite, shape: BoxShape.circle),
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Lorem ipsum is a text",
                                              style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 5,
                                            width: 5,
                                            margin: const EdgeInsets.only(right: 5),
                                            decoration: const BoxDecoration(color: backgroundWhite, shape: BoxShape.circle),
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Lorem ipsum is a text",
                                              style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.MEMBERSHIP_SCREEN);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(8))),
                                      child: const Text(
                                        "Buy Now",
                                        style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: backgroundCyan),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: height * 0.28,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    color: backgroundCyan,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: height * 0.13,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "PLAN NAME",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: ROBOTO_MEDIUM,
                                                color: backgroundWhite,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "\$109",
                                              style: TextStyle(fontSize: 30, fontFamily: ROBOTO_BOLD, color: backgroundWhite),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Every 6 Months",
                                              style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Image.asset(AppImages().dividerIcon, height: height * 0.02, width: 150, fit: BoxFit.fitWidth),
                                      Container(
                                        height: height * 0.13,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 5,
                                                      margin: const EdgeInsets.only(right: 5),
                                                      decoration: const BoxDecoration(color: backgroundWhite, shape: BoxShape.circle),
                                                    ),
                                                    const Expanded(
                                                      child: Text(
                                                        "Lorem ipsum is a text",
                                                        style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 5,
                                                      margin: const EdgeInsets.only(right: 5),
                                                      decoration: const BoxDecoration(color: backgroundWhite, shape: BoxShape.circle),
                                                    ),
                                                    const Expanded(
                                                      child: Text(
                                                        "Lorem ipsum is a text",
                                                        style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context, Routes.MEMBERSHIP_SCREEN);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(8))),
                                                child: const Text(
                                                  "Buy Now",
                                                  style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: backgroundCyan),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height * 0.28,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    color: backgroundCyan,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: height * 0.13,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "PLAN NAME",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: ROBOTO_MEDIUM,
                                                color: backgroundWhite,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "\$109",
                                              style: TextStyle(fontSize: 30, fontFamily: ROBOTO_BOLD, color: backgroundWhite),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Every Year",
                                              style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Image.asset(AppImages().dividerIcon, height: height * 0.02, width: 150, fit: BoxFit.fitWidth),
                                      Container(
                                        height: height * 0.13,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 5,
                                                      margin: const EdgeInsets.only(right: 5),
                                                      decoration: const BoxDecoration(color: backgroundWhite, shape: BoxShape.circle),
                                                    ),
                                                    const Expanded(
                                                      child: Text(
                                                        "Lorem ipsum is a text",
                                                        style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 5,
                                                      margin: const EdgeInsets.only(right: 5),
                                                      decoration: const BoxDecoration(color: backgroundWhite, shape: BoxShape.circle),
                                                    ),
                                                    const Expanded(
                                                      child: Text(
                                                        "Lorem ipsum is a text",
                                                        style: TextStyle(fontSize: 10, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context, Routes.MEMBERSHIP_SCREEN);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(8))),
                                                child: const Text(
                                                  "Buy Now",
                                                  style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: backgroundCyan),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(left: -5, top: -5, child: Image.asset(AppImages().planBadgeIcon, scale: 4.5))
                        ],
                      ),
                    ],
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
