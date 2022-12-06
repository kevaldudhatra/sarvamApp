import 'package:flutter/material.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';

class PrayerScreenView extends StatefulWidget {
  const PrayerScreenView({Key? key}) : super(key: key);

  @override
  State<PrayerScreenView> createState() => _PrayerScreenViewState();
}

class _PrayerScreenViewState extends State<PrayerScreenView> {
  int selectedCategory = 0;
  int currentIndex = 10;
  String? selectedYear = "2022";
  List<String> yearList = ["1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"];
  String? selectedMonth = "November";
  List<String> monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

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
                        "Daily Routine  > ${arguments["prayerName"]!}",
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
                SizedBox(
                  width: width,
                  height: height - 350,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 1;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Gayatri Mantra"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 1 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Gayatri Mantra",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 1 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 1
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Navkar Mantra"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 2 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Navkar Mantra",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 2 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 2
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Aum Dhun"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 3 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Aum Dhun",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 3 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 3
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 1"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 4 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 1",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 4 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 4
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 2"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 5 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 2",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 5 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 5
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 3"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 6 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 3",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 6 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 6
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Aum Dhun"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 7 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Aum Dhun",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 7 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 7
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 1"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 8 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 1",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 8 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 8
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = 9;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 2"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 9 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 2",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 9 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 9
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 9
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
                            selectedCategory = 10;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 3"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 10 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 3",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 10 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 10
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 10
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
                            selectedCategory = 11;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 2"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 11 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 2",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 11 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 11
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 11
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
                            selectedCategory = 12;
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushNamed(context, Routes.PRAYER_DETAIL_SCREEN,arguments: {"prayerSubName":"Mantra 3"});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(color: selectedCategory == 12 ? selectedCategoryRed : backgroundWhite, borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Mantra 3",
                                style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: selectedCategory == 12 ? backgroundWhite : textBlack),
                              ),
                            ),
                            selectedCategory == 12
                                ? Image.asset(
                                    AppImages().selectedDoneIconRed,
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(),
                            selectedCategory == 12
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
