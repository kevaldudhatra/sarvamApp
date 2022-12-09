import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/screens/resetPasswordScreen/reset_password_screen_view.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreenController extends GetxController {
  final storage = GetStorage();

  Future<dynamic> forgotPassword(String email, {bool isLoading = true}) async {
    print("forgotPassword input Data $email");
    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }
    var response = await http.post(Uri.parse(ApiServices.ForgotPassword), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "EmailID": email}));
    print('forgotPassword Response status: ${response.statusCode}');
    print('forgotPassword Response body: ${response.body}');
    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      Get.to(() => const ResetPasswordScreen(),arguments: [email,data["Tag"]]);
      Get.snackbar("Success", "Email OTP sending successfully", icon: const Icon(Icons.done, color: Colors.white), duration: const Duration(seconds: 2), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
    } else {
      Get.snackbar("Oops!", "Email OTP sending failed", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
    }
  }
}
