// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarvam/screens/dailyRoutineScreen/daily_routine_screen_controller.dart';
import 'package:sarvam/screens/prayerScreen/prayer_screen_view.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/widgets/loading_view.dart';

class DailyRoutineScreenView extends StatefulWidget {
  dynamic categoryData;
  bool? categoryColor1 = false;
  bool? categoryColor2 = false;
  bool? categoryColor3 = false;
  bool? categoryColor4 = false;

  DailyRoutineScreenView({Key? key, required this.categoryData, this.categoryColor1, this.categoryColor2, this.categoryColor3, this.categoryColor4}) : super(key: key);

  @override
  State<DailyRoutineScreenView> createState() => _DailyRoutineScreenViewState();
}

class _DailyRoutineScreenViewState extends State<DailyRoutineScreenView> {
  DailyRoutineScreenController dailyRoutineScreenController = DailyRoutineScreenController();
  int selectedCategory = -1;

  @override
  void initState() {
    dailyRoutineScreenController.getSubCategories(catId: widget.categoryData["CatID"]);
    super.initState();
  }

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
            child: Image.asset(AppImages().dailyRoutineBackground, fit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
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
                        widget.categoryData["Name"],
                        style: const TextStyle(fontSize: 22, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Lorem ipsum is a placeholder",
                        style: TextStyle(fontSize: 13, fontFamily: ROBOTO_REGULAR, color: textBlack),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  return SizedBox(
                    width: width,
                    height: height - 255,
                    child: dailyRoutineScreenController.loading.value
                        ? LoadingDialog()
                        : dailyRoutineScreenController.subCategoryList.isNotEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.symmetric(vertical: 25),
                                itemCount: dailyRoutineScreenController.subCategoryList.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10, mainAxisSpacing: 15, crossAxisCount: 2, childAspectRatio: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = index;
                                      });
                                      Future.delayed(const Duration(milliseconds: 500), () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerScreenView(
                                            subCategoryData: dailyRoutineScreenController.subCategoryList[index],
                                          categoryColor1: widget.categoryColor1,
                                          categoryColor2: widget.categoryColor2,
                                          categoryColor3: widget.categoryColor3,
                                          categoryColor4: widget.categoryColor4,
                                        )));
                                      });
                                    },
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(top: 15),
                                          decoration: BoxDecoration(
                                              color: selectedCategory == index && widget.categoryColor1!
                                                  ? category1
                                                  : selectedCategory == index && widget.categoryColor2!
                                                      ? category2
                                                      : selectedCategory == index && widget.categoryColor3!
                                                          ? category3
                                                          : selectedCategory == index && widget.categoryColor4!
                                                              ? category4
                                                              : backgroundWhite,
                                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                                          child: Text(
                                            dailyRoutineScreenController.subCategoryList[index]["Name"],
                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == index ? backgroundWhite : textBlack),
                                          ),
                                        ),
                                        selectedCategory == index && widget.categoryColor1!
                                            ? Image.asset(
                                                AppImages().selectedDoneIconRed,
                                                fit: BoxFit.fill,
                                                height: 30,
                                                width: 30,
                                              )
                                            : selectedCategory == index && widget.categoryColor2!
                                                ? Image.asset(
                                                    AppImages().selectedDoneIconGreen,
                                                    fit: BoxFit.fill,
                                                    height: 30,
                                                    width: 30,
                                                  )
                                                : selectedCategory == index && widget.categoryColor3!
                                                    ? Image.asset(
                                                        AppImages().selectedDoneIconBlue,
                                                        fit: BoxFit.fill,
                                                        height: 30,
                                                        width: 30,
                                                      )
                                                    : selectedCategory == index && widget.categoryColor4!
                                                        ? Image.asset(
                                                            AppImages().selectedDoneIconYellow,
                                                            fit: BoxFit.fill,
                                                            height: 30,
                                                            width: 30,
                                                          )
                                                        : Container(),
                                        selectedCategory == index
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
                                  );
                                },
                              )
                            : const Center(
                                child: Text(
                                  "Oops!\nNo Data Found",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: textBlack),
                                ),
                              ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
