import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  final storage = GetStorage();

  Future<dynamic> logIn(String email, String password, {bool isLoading = true}) async {
    print("logIn input Data $email");
    print("logIn input Data $password");
    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }
    var response = await http.post(Uri.parse(ApiServices.Login), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": "Android", "EmailID": email, "Pass": password}));
    print('logIn Response status: ${response.statusCode}');
    print('logIn Response body: ${response.body}');
    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      await storage.write(USER_ID, data["UserID"]);
      await storage.write(LOGIN_TRUE, true);
      Get.toNamed(Routes.HOME_SCREEN);
    } else {
      storage.erase();
      Get.snackbar("Oops!", "Please enter valid login credential", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
    }
  }
}
