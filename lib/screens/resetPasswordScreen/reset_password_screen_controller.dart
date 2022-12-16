import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:http/http.dart' as http;

class ResetPasswordScreenController extends GetxController {
  final storage = GetStorage();
  Future<dynamic> resetPassword(String email, String tag,String otp,String password,{bool isLoading = true}) async {
    print("resetPassword input Data $email");
    print("resetPassword input Data $tag");
    print("resetPassword input Data $otp");
    print("resetPassword input Data $password");
    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }
    var response = await http.post(Uri.parse(ApiServices.ResetPassword), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "EmailID": email,"Tag":tag,"OTP":otp,"Pass":password}));
    print('resetPassword Response status: ${response.statusCode}');
    print('resetPassword Response body: ${response.body}');
    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      Get.toNamed(Routes.LOGIN_SCREEN);
    } else {
      Get.snackbar("Oops!", "Reset password failed please try again later", icon: const Icon(Icons.error, color: Colors.red), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
    }
  }
}
