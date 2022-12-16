// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/screens/prayerDetailScreen/prayer_detail_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/widgets/loading_view.dart';

class PrayerDetailScreenView extends StatefulWidget {
  dynamic contentData;

  PrayerDetailScreenView({Key? key, required this.contentData}) : super(key: key);

  @override
  State<PrayerDetailScreenView> createState() => _PrayerDetailScreenViewState();
}

class _PrayerDetailScreenViewState extends State<PrayerDetailScreenView> {
  TextEditingController commentController = TextEditingController();
  PrayerDetailScreenController prayerDetailScreenController = PrayerDetailScreenController();

  // VideoPlayerController? videoPlayerController;
  // ChewieController? chewieController;
  // bool looping = false;
  // bool autoplay = false;

  @override
  void initState() {
    prayerDetailScreenController.getContentDetails(contentID: widget.contentData["ContentID"]);
    super.initState();
  }

  // @override
  // void dispose() {
  //   videoPlayerController!.dispose();
  //   chewieController!.dispose();
  //   super.dispose();
  // }

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
          Obx(() {
            if (prayerDetailScreenController.loading.value) {
              return LoadingDialog();
            } else {
              return prayerDetailScreenController.contentDetails.isNotEmpty
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            margin: const EdgeInsets.only(top: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10, right: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Image.asset(AppImages().backArrow, scale: 3.0, color: backgroundCyan),
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      const Text(
                                        "Back",
                                        style: TextStyle(fontSize: 15, fontFamily: ROBOTO_BOLD, color: backgroundCyan),
                                      ),
                                      const Spacer(),
                                      Image.asset(AppImages().drawerIcon, color: pageIndicator, fit: BoxFit.fill, scale: 2.5),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    prayerDetailScreenController.contentDetails["Name"],
                                    style: const TextStyle(fontSize: 22, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    prayerDetailScreenController.contentDetails["ShortDesp"],
                                    style: const TextStyle(fontSize: 13, fontFamily: ROBOTO_REGULAR, color: textBlack),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  /*SizedBox(
                                    height: 210,
                                    width: width - 40,
                                    child: Chewie(
                                      controller: ChewieController(
                                        videoPlayerController: VideoPlayerController.network(prayerDetailScreenController.contentDetails["ContentFile"]),
                                        autoInitialize: true,
                                        autoPlay: autoplay,
                                        looping: looping,
                                        aspectRatio: 2,
                                        materialProgressColors: ChewieProgressColors(
                                          playedColor: backgroundCyan,
                                          handleColor: backgroundWhite,
                                          backgroundColor: backgroundWhite,
                                          bufferedColor: backgroundWhite.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                  SizedBox(
                                    height: 210,
                                    width: width - 40,
                                    child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(prayerDetailScreenController.contentDetails["ContentThumb"], fit: BoxFit.fill)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.UPLOAD_WORK_SCREEN, arguments: {"contentID": widget.contentData["ContentID"]});
                                    },
                                    child: Container(
                                      height: 40,
                                      width: width * 0.45,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(top: 10),
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(color: backgroundCyan, borderRadius: BorderRadius.circular(22.5)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(AppImages().uploadIcon, color: backgroundWhite, scale: 2.5),
                                          const Text(
                                            "Upload your work",
                                            style: TextStyle(fontFamily: ROBOTO_BOLD, color: backgroundWhite),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: width,
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 95),
                                decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(right: 20),
                                      decoration: const BoxDecoration(
                                        color: backgroundWhite,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12, //New
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: width * 0.75,
                                            child: TextField(
                                              controller: commentController,
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.text,
                                              style: const TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_REGULAR),
                                              cursorColor: textBlack,
                                              decoration: const InputDecoration(
                                                hintText: "Add comment...",
                                                contentPadding: EdgeInsets.only(
                                                  bottom: 10,
                                                  top: 10,
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                hintStyle: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: ROBOTO_REGULAR),
                                                filled: true,
                                                fillColor: backgroundWhite,
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                  borderSide: BorderSide(color: Colors.transparent),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                  borderSide: BorderSide(color: Colors.transparent),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(AppImages().sendIcon, scale: 2.5),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                      child: const Text(
                                        "Comments",
                                        style: TextStyle(fontSize: 15, fontFamily: ROBOTO_BOLD, color: textBlack),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.50,
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      decoration: const BoxDecoration(
                                          color: backgroundWhite,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12, //New
                                              blurRadius: 10,
                                            ),
                                          ]),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(AppImages().dummyChetImage, scale: 2.5),
                                                Container(
                                                  width: width - 120,
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            "Comments",
                                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                          Text(
                                                            "1 Day ago",
                                                            style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                                        child: const Text(
                                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual",
                                                          style: TextStyle(fontSize: 12, fontFamily: ROBOTO_REGULAR, color: Colors.grey),
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(AppImages().dummyChetImage, scale: 2.5),
                                                Container(
                                                  width: width - 120,
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            "Comments",
                                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                          Text(
                                                            "1 Day ago",
                                                            style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                                        child: const Text(
                                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual",
                                                          style: TextStyle(fontSize: 12, fontFamily: ROBOTO_REGULAR, color: Colors.grey),
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(AppImages().dummyChetImage, scale: 2.5),
                                                Container(
                                                  width: width - 120,
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            "Comments",
                                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                          Text(
                                                            "1 Day ago",
                                                            style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                                        child: const Text(
                                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual",
                                                          style: TextStyle(fontSize: 12, fontFamily: ROBOTO_REGULAR, color: Colors.grey),
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(AppImages().dummyChetImage, scale: 2.5),
                                                Container(
                                                  width: width - 120,
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            "Comments",
                                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                          Text(
                                                            "1 Day ago",
                                                            style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                                        child: const Text(
                                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual",
                                                          style: TextStyle(fontSize: 12, fontFamily: ROBOTO_REGULAR, color: Colors.grey),
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(AppImages().dummyChetImage, scale: 2.5),
                                                Container(
                                                  width: width - 120,
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            "Comments",
                                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                          Text(
                                                            "1 Day ago",
                                                            style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                                        child: const Text(
                                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual",
                                                          style: TextStyle(fontSize: 12, fontFamily: ROBOTO_REGULAR, color: Colors.grey),
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(AppImages().dummyChetImage, scale: 2.5),
                                                Container(
                                                  width: width - 120,
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            "Comments",
                                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                          Text(
                                                            "1 Day ago",
                                                            style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                                        child: const Text(
                                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual",
                                                          style: TextStyle(fontSize: 12, fontFamily: ROBOTO_REGULAR, color: Colors.grey),
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(AppImages().dummyChetImage, scale: 2.5),
                                                Container(
                                                  width: width - 120,
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Text(
                                                            "Comments",
                                                            style: TextStyle(fontSize: 15, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                          Text(
                                                            "1 Day ago",
                                                            style: TextStyle(fontSize: 12, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                                        child: const Text(
                                                          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual",
                                                          style: TextStyle(fontSize: 12, fontFamily: ROBOTO_REGULAR, color: Colors.grey),
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: Text(
                        "Oops!\nNo Data Found",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontFamily: ROBOTO_REGULAR, color: textBlack),
                      ),
                    );
            }
          })
        ],
      ),
    );
  }
}
