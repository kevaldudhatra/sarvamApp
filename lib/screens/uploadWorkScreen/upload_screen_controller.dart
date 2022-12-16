import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;
import 'package:sarvam/widgets/loading_view.dart';

class UploadScreenController extends GetxController {
  final storage = GetStorage();

  Future<bool> uploadMedia({bool isLoading = true, required int contentID, required String workName, required String workDescription, required PlatformFile mediaFile}) async {
    try {
      print('uploadMedia input Data $contentID');
      print('uploadMedia input Data $workName');
      print('uploadMedia input Data $workDescription');
      print('uploadMedia input Data ${mediaFile.path}');
      if (isLoading) {
        Get.dialog(LoadingDialog(), barrierDismissible: false);
      }
      var request = http.MultipartRequest('POST', Uri.parse("https://sarvam.whizapps.in/API/UploadWork.ashx"));
      request.headers.addAll({"Content-Type": "multipart/form-data; boundary=<calculated when request is sent>"});
      request.fields['APIKey'] = API_KEY;
      request.fields['CallFrom'] = PLATFORM;
      request.fields['UserID'] = storage.read(USER_ID);
      request.fields['ContentID'] = "$contentID";
      request.fields['Name'] = workName;
      request.fields['Desp'] = workDescription;
      request.files.add(
        http.MultipartFile(
          'File',
          File(mediaFile.path!).readAsBytes().asStream(),
          File(mediaFile.path!).lengthSync(),
          filename: mediaFile.path!.split("/").last,
        ),
      );
      var response = await request.send();
      if (isLoading && Get.isDialogOpen!) {
        Get.back();
      }
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Your work upload successfully", icon: const Icon(Icons.done, color: Colors.white), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
        return true;
      } else {
        Get.snackbar("Oops!", "Your work upload failed", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
