import 'package:flutter/material.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';

class CategoryScreenView extends StatefulWidget {
  const CategoryScreenView({Key? key}) : super(key: key);

  @override
  State<CategoryScreenView> createState() => _CategoryScreenViewState();
}

class _CategoryScreenViewState extends State<CategoryScreenView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(AppImages().categoryBackground, fit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 75),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Text(
                          "01",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 15, color: backgroundCyan),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 5,
                            width: width * 0.45,
                            decoration: const BoxDecoration(color: lightCyanBackground, borderRadius: BorderRadius.all(Radius.circular(3))),
                          ),
                          Container(
                            height: 5,
                            width: width * 0.15,
                            decoration: const BoxDecoration(color: pageIndicator, borderRadius: BorderRadius.all(Radius.circular(3))),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(AppImages().drawerIcon, color: pageIndicator, fit: BoxFit.fill, scale: 2.5),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height - 175,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.DAILY_ROUTINE_SCREEN, arguments: {'categoryName': 'Daily Routine'});
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(AppImages().categoryIcon_1, width: width / 2 - 25),
                                const Text(
                                  "Daily\nRoutine",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 25, color: backgroundWhite),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.DAILY_ROUTINE_SCREEN,arguments: {'categoryName': 'Skill Creative'});
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(AppImages().categoryIcon_2, width: width / 2 - 25),
                                const Text(
                                  "Skill\nCreative",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 25, color: backgroundWhite),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.DAILY_ROUTINE_SCREEN,arguments: {'categoryName': 'Knowledge Skill'});
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(AppImages().categoryIcon_3, width: width / 2 - 25),
                                const Text(
                                  "Knowledge\nSkill",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 25, color: backgroundWhite),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.DAILY_ROUTINE_SCREEN,arguments: {'categoryName': 'Real Life Skill'});
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(AppImages().categoryIcon_4, width: width / 2 - 25),
                                const Text(
                                  "Real\nLife Skill",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 25, color: backgroundWhite),
                                )
                              ],
                            ),
                          ),
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
