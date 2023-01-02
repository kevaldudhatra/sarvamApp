import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/custom_text_field.dart';

class GrievancesScreenView extends StatefulWidget {
  const GrievancesScreenView({Key? key}) : super(key: key);

  @override
  State<GrievancesScreenView> createState() => _GrievancesScreenViewState();
}

class _GrievancesScreenViewState extends State<GrievancesScreenView> {
  TextEditingController comment = TextEditingController();
  PlatformFile? selectedFile;
  double userRating = 0.0;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    setState(() {
      if (result != null) {
        selectedFile = result.files.first;
      } else {
        selectedFile = null;
      }
    });
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
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
            height: height,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Image.asset(AppImages().backArrow, scale: 3.0, color: backgroundWhite),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Back",
                                      style: TextStyle(fontSize: 15, fontFamily: ROBOTO_BOLD, color: backgroundWhite),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Image.asset(AppImages().profileIcon, fit: BoxFit.fill, scale: 3)
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height * 0.05),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Grievances",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 30, color: backgroundWhite),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 35,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              userRating = rating;
                            },
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Comments",
                            style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_BOLD),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              color: backgroundWhite,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12, //New
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: CustomTextField(
                              textEditingController: comment,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              hint: "Enter description...",
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 35),
                          const Text(
                            "Upload File",
                            style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_BOLD),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 130,
                            width: width,
                            decoration: const BoxDecoration(
                              color: backgroundWhite,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12, //New
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                pickFile();
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(AppImages().uploadFileIcon, width: 65, height: 65),
                                  const Text(
                                    "Upload File",
                                    style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_BOLD),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Max. File size : 200mb",
                                    style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: ROBOTO_BOLD),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          selectedFile != null
                              ? Container(
                                  width: width,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: backgroundWhite,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12, //New
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(AppImages().dummyFileIcon, height: 40, width: 40, fit: BoxFit.fill),
                                          SizedBox(
                                            width: width - 135,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  selectedFile!.name,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(color: textBlack, fontSize: 13, fontFamily: ROBOTO_BOLD),
                                                ),
                                                Text(
                                                  "${((selectedFile!.size / 1024.0) / 1024.0).toStringAsFixed(2)} MB",
                                                  maxLines: 1,
                                                  style: TextStyle(color: textBlack.withOpacity(0.5), fontSize: 10, fontFamily: ROBOTO_BOLD),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedFile = null;
                                            });
                                          },
                                          child: Image.asset(AppImages().closeIcon, height: 25, width: 25)),
                                    ],
                                  ),
                                )
                              : Container(),
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              height: 50,
                              width: 150,
                              child: CustomButton(
                                label: "SUBMIT",
                                labelColor: backgroundWhite,
                                borderColor: Colors.transparent,
                                buttonColor: backgroundCyan,
                                onTap: () async {
                                  if (userRating == 0.0) {
                                    Get.snackbar("Oops!", "Rating required!", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.black, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                  } else if (comment.text.toString().isEmpty) {
                                    Get.snackbar("Oops!", "Comment required!", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.black, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                  } else if (selectedFile == null) {
                                    Get.snackbar("Oops!", "Please select the file to upload", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.black, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                  } else {

                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
