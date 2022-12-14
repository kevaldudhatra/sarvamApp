import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/screens/membershipScreen/membership_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'dart:io' show Platform;

class MembershipScreenView extends StatefulWidget {
  const MembershipScreenView({Key? key}) : super(key: key);

  @override
  State<MembershipScreenView> createState() => _MembershipScreenViewState();
}

class _MembershipScreenViewState extends State<MembershipScreenView> {
  MembershipScreenController membershipScreenController = Get.put(MembershipScreenController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
            margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: Platform.isAndroid ? 75 : 120),
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
                  height: height * 0.45,
                  margin: const EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: lightCyanBackground,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            arguments["detailPlanData"]["Name"],
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: ROBOTO_BOLD,
                              color: backgroundCyan,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$${arguments["detailPlanData"]["Price"]}",
                            style: const TextStyle(fontSize: 30, fontFamily: ROBOTO_BOLD, color: backgroundCyan),
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
                              Expanded(
                                child: Text(
                                  arguments["detailPlanData"]["LongDesp"],
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontFamily: ROBOTO_REGULAR, color: textBlack),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              membershipScreenController.purchasePlan(arguments["detailPlanData"]["PlanID"]).then(
                                    (value) => {
                                      if (value)
                                        {
                                          // Navigator.pushNamed(context, Routes.CATEGORY_SCREEN),
                                          Navigator.pushNamedAndRemoveUntil(context, Routes.CATEGORY_SCREEN, (r) => false),
                                        },
                                    },
                                  );
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
