import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;
import 'package:sarvam/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:sarvam/utils/const_colors_key.dart';

class MyProfileScreenController extends GetxController {
  final storage = GetStorage();
  RxBool loading = false.obs;
  final userDetails = <String, dynamic>{}.obs;

  Future<dynamic> getUserDetails() async {
    try {
      loading.value = true;
      var response = await http.post(Uri.parse(ApiServices.GetUserProfile), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID)}));
      print('getUserDetails Response status: ${response.statusCode}');
      print('getUserDetails Response body: ${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["Success"] == true) {
        userDetails.value = data;
        loading.value = false;
      } else {
        userDetails.value = {};
        loading.value = false;
      }
    } catch (e) {
      userDetails.value = {};
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }

  Future<bool> updateUserDetails(String name, String email, String selectedDate, String selectedPhoneCode, String phoneNumber, String selectedCountry, String postalCode, String address, String role, {bool isLoading = true}) async {
    print("updateUserDetails input Data $name");
    print("updateUserDetails input Data $email");
    print("updateUserDetails input Data $selectedDate");
    print("updateUserDetails input Data $selectedPhoneCode");
    print("updateUserDetails input Data $phoneNumber");
    print("updateUserDetails input Data $selectedCountry");
    print("updateUserDetails input Data $postalCode");
    print("updateUserDetails input Data $address");
    print("updateUserDetails input Data $role");

    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }

    var response = await http.post(Uri.parse(ApiServices.UpdateUserProfile), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID), "Name": name, "EmailID": email, "Mobile": phoneNumber, "DOB": selectedDate, "CountryCode": selectedPhoneCode, "Country": selectedCountry, "Pincode": postalCode, "Addr": address, "Gender": role}));

    print('updateUserDetails Response status: ${response.statusCode}');
    print('updateUserDetails Response body: ${response.body}');

    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }

    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      Get.snackbar("Success", "User details update successfully", icon: const Icon(Icons.done, color: Colors.green), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
      return true;
    } else if (response.statusCode == 200 && data["Success"] == false) {
      Get.snackbar("Oops!", data["Message"], icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
      return false;
    } else {
      Get.snackbar("Oops!", "Failed to update user details!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
      return false;
    }
  }
}
