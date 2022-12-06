import 'package:flutter/material.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';

class DailyRoutineScreenView extends StatefulWidget {
  const DailyRoutineScreenView({Key? key}) : super(key: key);

  @override
  State<DailyRoutineScreenView> createState() => _DailyRoutineScreenViewState();
}

class _DailyRoutineScreenViewState extends State<DailyRoutineScreenView> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(AppImages().dailyRoutineBackground, fit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 75),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Text(
                              "02",
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
                                width: width * 0.30,
                                decoration: const BoxDecoration(color: pageIndicator, borderRadius: BorderRadius.all(Radius.circular(3))),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(AppImages().drawerIcon, color: pageIndicator, fit: BoxFit.fill, scale: 2.5),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        arguments["categoryName"]!,
                        style: const TextStyle(fontSize: 25, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Lorem ipsum is a placeholder",
                        style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: textBlack),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height - 280,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 1;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Prayer"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 1 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Prayer",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 1 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 1
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 1
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 2;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Yoga/Pranayam"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 2 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Yoga/Pranayam",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 2 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 2
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 2
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 3;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Aum Dhun"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 3 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Aum Dhun",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 3 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 3
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 3
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 4;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Mantra 1"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 4 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 1",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 4 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 4
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 4
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 5;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Mantra 2"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 5 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 2",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 5 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 5
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 5
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 6;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Mantra 3"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 6 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 3",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 6 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 6
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 6
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 7;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Aum Dhun"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 7 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Aum Dhun",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 7 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 7
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 7
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 8;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_SCREEN,arguments: {"prayerName":"Mantra 1"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 8 ? selectedCategoryGreen : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 1",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 8 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 8
                                ? Image.asset(
                                    AppImages().selectedDoneIconGreen,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 8
                                ? Positioned(
                                    bottom: -5,
                                    right: -5,
                                    child: Image.asset(
                                      AppImages().selectedLeafIcon,
                                      fit: BoxFit.fill,
                                      scale: 3.5,
                                    ),
                                  )
                                : Container(),
                          ],
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
    );
  }
}
