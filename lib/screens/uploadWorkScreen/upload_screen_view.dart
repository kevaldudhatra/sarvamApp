import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sarvam/screens/uploadWorkScreen/upload_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/custom_text_field.dart';

class UploadScreenView extends StatefulWidget {
  const UploadScreenView({Key? key}) : super(key: key);

  @override
  State<UploadScreenView> createState() => _UploadScreenViewState();
}

class _UploadScreenViewState extends State<UploadScreenView> {
  TextEditingController workName = TextEditingController();
  TextEditingController workDescription = TextEditingController();
  UploadScreenController uploadScreenController = UploadScreenController();
  PlatformFile? selectedFile;

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
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(AppImages().dailyRoutineBackground, fit: BoxFit.fill),
          ),
          SingleChildScrollView(
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
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Upload Your Work",
                          style: TextStyle(fontSize: 25, fontFamily: ROBOTO_MEDIUM, color: textBlack),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Lorem ipsum is a placeholder",
                          style: TextStyle(fontSize: 15, fontFamily: ROBOTO_REGULAR, color: textBlack),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height - 180,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 100),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Work Name",
                          style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_BOLD),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 40,
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
                            textEditingController: workName,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            hint: "Enter work name",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Work description",
                          style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_BOLD),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 100,
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
                            textEditingController: workDescription,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            hint: "Enter description...",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Upload Work",
                          style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_BOLD),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 150,
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
                                Image.asset(AppImages().uploadFileIcon, width: 70, height: 70),
                                const Text(
                                  "Upload Work",
                                  style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_BOLD),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Max. File size : 200mb",
                                  style: TextStyle(color: textBlack.withOpacity(0.5), fontSize: 15, fontFamily: ROBOTO_BOLD),
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
                                if (workName.text.toString().isEmpty) {
                                  Get.snackbar("Oops!", "Work Name required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else if (workDescription.text.toString().isEmpty) {
                                  Get.snackbar("Oops!", "Work Description required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else if (selectedFile == null) {
                                  Get.snackbar("Oops!", "Please select the file to upload", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                                } else {
                                  var result = await uploadScreenController.uploadMedia(contentID: arguments["contentID"], workName: workName.text.toString(), workDescription: workDescription.text.toString(), mediaFile: selectedFile!);
                                  if (result) {
                                    setState(() {
                                      selectedFile = null;
                                      workName.clear();
                                      workDescription.clear();
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
