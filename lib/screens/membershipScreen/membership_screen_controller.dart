import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:http/http.dart' as http;

class MembershipScreenController extends GetxController {
  final storage = GetStorage();

  Future<bool> purchasePlan(int planId,{bool isLoading = true}) async {
    print("purchasePlan input Data $planId");
    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }
    var response = await http.post(Uri.parse(ApiServices.PurchasePlan), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "PlanID": planId, "UserID": storage.read(USER_ID)}));
    print('purchasePlan Response status: ${response.statusCode}');
    print('purchasePlan Response body: ${response.body}');
    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      await storage.write(ACTIVE_PLAN, true);
      return true;
    } else {
      Get.snackbar("Oops!", "Purchase failed, please try again later.", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
      return false;
    }
  }
}