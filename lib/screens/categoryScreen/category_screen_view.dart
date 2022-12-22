import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarvam/screens/dailyRoutineScreen/daily_routine_screen_view.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/screens/categoryScreen/category_screen_controller.dart';
import 'package:sarvam/widgets/loading_view.dart';

class CategoryScreenView extends StatefulWidget {
  const CategoryScreenView({Key? key}) : super(key: key);

  @override
  State<CategoryScreenView> createState() => _CategoryScreenViewState();
}

class _CategoryScreenViewState extends State<CategoryScreenView> {
  CategoryScreenController categoryScreenController = CategoryScreenController();

  @override
  void initState() {
    categoryScreenController.getMainCategories();
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
            child: Image.asset(AppImages().categoryBackground, fit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
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
                      // IconButton(
                      //   onPressed: (){
                      //     print("DATA");
                      //   },
                      //   padding: EdgeInsets.zero,
                      //   icon: Image.asset(AppImages().drawerIcon, color: pageIndicator, fit: BoxFit.fill, scale: 2.5),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height - 175,
                  child: Obx(() {
                    if (categoryScreenController.loading.value) {
                      return LoadingDialog();
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => DailyRoutineScreenView(categoryData: categoryScreenController.categoryList[0],categoryColor1: true)));
                                },
                                child: SizedBox(
                                  width: width / 2 - 25,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(AppImages().categoryIcon_1, fit: BoxFit.fitWidth),
                                      Text(
                                        categoryScreenController.categoryList[0]["Name"],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 20, color: backgroundWhite),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => DailyRoutineScreenView(categoryData: categoryScreenController.categoryList[1],categoryColor2: true)));
                                },
                                child: SizedBox(
                                  width: width / 2 - 25,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(AppImages().categoryIcon_2, fit: BoxFit.fitWidth),
                                      Text(
                                        categoryScreenController.categoryList[1]["Name"],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 20, color: backgroundWhite),
                                      )
                                    ],
                                  ),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => DailyRoutineScreenView(categoryData: categoryScreenController.categoryList[2],categoryColor3: true)));
                                },
                                child: SizedBox(
                                  width: width / 2 - 25,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(AppImages().categoryIcon_3, fit: BoxFit.fitWidth),
                                      Text(
                                        categoryScreenController.categoryList[2]["Name"],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 20, color: backgroundWhite),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => DailyRoutineScreenView(categoryData: categoryScreenController.categoryList[3],categoryColor4: true)));
                                },
                                child: SizedBox(
                                  width: width / 2 - 25,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(AppImages().categoryIcon_4, fit: BoxFit.fitWidth),
                                      Text(
                                        categoryScreenController.categoryList[3]["Name"],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 20, color: backgroundWhite),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
