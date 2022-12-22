// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarvam/screens/prayerDetailScreen/prayer_detail_screen_view.dart';
import 'package:sarvam/screens/prayerScreen/prayer_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/widgets/loading_view.dart';

class PrayerScreenView extends StatefulWidget {
  dynamic subCategoryData;
  bool? categoryColor1 = false;
  bool? categoryColor2 = false;
  bool? categoryColor3 = false;
  bool? categoryColor4 = false;

  PrayerScreenView({Key? key, required this.subCategoryData, this.categoryColor1, this.categoryColor2, this.categoryColor3, this.categoryColor4}) : super(key: key);

  @override
  State<PrayerScreenView> createState() => _PrayerScreenViewState();
}

class _PrayerScreenViewState extends State<PrayerScreenView> {
  PrayerScreenController prayerScreenController = PrayerScreenController();
  int selectedCategory = -1;
  int currentIndex = 10;
  String? selectedYear = "2022";
  List<String> yearList = ["1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"];
  String? selectedMonth = "November";
  List<String> monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

  @override
  void initState() {
    prayerScreenController.getContent(subCatID: widget.subCategoryData["SubCatID"]);
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
                              "03",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 15, color: backgroundCyan),
                            ),
                          ),
                          Container(
                            height: 5,
                            width: width * 0.45,
                            decoration: const BoxDecoration(color: pageIndicator, borderRadius: BorderRadius.all(Radius.circular(3))),
                          ),
                          const Spacer(),
                          Image.asset(AppImages().drawerIcon, color: pageIndicator, fit: BoxFit.fill, scale: 2.5),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Daily Routine  > ${widget.subCategoryData["Name"]}",
                        style: const TextStyle(fontSize: 22, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.subCategoryData["ShortDesp"],
                        style: const TextStyle(fontSize: 13, fontFamily: ROBOTO_REGULAR, color: textBlack),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(bottom: 25),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(20)), boxShadow: [
                          BoxShadow(
                            color: Colors.black12, //New
                            blurRadius: 10,
                          ),
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentIndex != 0) {
                                    currentIndex--;
                                    selectedMonth = monthList[currentIndex];
                                  }
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(Icons.chevron_left, color: Colors.grey),
                              ),
                            ),
                            Text(
                              selectedMonth!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: textBlack),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentIndex != 11) {
                                    currentIndex++;
                                    selectedMonth = monthList[currentIndex];
                                  }
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(Icons.chevron_right, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        alignment: Alignment.center,
                        width: 90,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(20)), boxShadow: [
                          BoxShadow(
                            color: Colors.black12, //New
                            blurRadius: 10,
                          ),
                        ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Image.asset(AppImages().dropdownIcon, scale: 3.5),
                            value: selectedYear!,
                            items: yearList
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(color: textBlack, fontSize: 15.0, fontFamily: ROBOTO_REGULAR),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (item) => setState(() => selectedYear = item),
                            isExpanded: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  return SizedBox(
                    width: width,
                    height: height - 320,
                    child: prayerScreenController.loading.value
                        ? LoadingDialog()
                        : prayerScreenController.contentList.isNotEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: prayerScreenController.contentList.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10, mainAxisSpacing: 15, crossAxisCount: 2, childAspectRatio: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = index;
                                      });
                                      Future.delayed(const Duration(milliseconds: 500), () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerDetailScreenView(contentData: prayerScreenController.contentList[index])));
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
                                            prayerScreenController.contentList[index]["Name"],
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
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
