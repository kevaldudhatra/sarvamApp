import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:http/http.dart' as http;

class RegisterScreenController extends GetxController {
  final storage = GetStorage();

  Future<dynamic> register(String name, String email, String password, String selectedDate, String selectedPhoneCode, String phoneNumber, String selectedCountry, String postalCode, String address, String role, {bool isLoading = true}) async {
    print("register input Data $name");
    print("register input Data $email");
    print("register input Data $password");
    print("register input Data $selectedDate");
    print("register input Data $selectedPhoneCode");
    print("register input Data $phoneNumber");
    print("register input Data $selectedCountry");
    print("register input Data $postalCode");
    print("register input Data $address");
    print("register input Data $role");

    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }
    var response = await http.post(Uri.parse(ApiServices.SignUp), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "Name": name, "EmailID": email, "Mobile": phoneNumber, "DOB": selectedDate, "CountryCode": selectedPhoneCode, "Country": selectedCountry, "Pincode": postalCode, "Addr": address, "Gender": role, "Pass": password}));

    print('register Response status: ${response.statusCode}');
    print('register Response body: ${response.body}');

    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      await storage.write(USER_ID, data["UserID"]);
      await storage.write(LOGIN_TRUE, true);
      Get.toNamed(Routes.HOME_SCREEN);
    } else if (response.statusCode == 200 && data["Success"] == false) {
      storage.erase();
      Get.snackbar("Oops!", data["Message"], icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
    } else {
      storage.erase();
      Get.snackbar("Oops!", "Registration failed", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
    }
  }
}
