import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;

class SubscriptionScreenController extends GetxController {
  final storage = GetStorage();
  RxList plans = [].obs;
  RxBool loading = false.obs;

  Future<dynamic> getPlans() async {
    try {
      loading.value = true;
      var response = await http.post(Uri.parse(ApiServices.GetPlans), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM}));
      print('getPlans Response status: ${response.statusCode}');
      print('getPlans Response body: ${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["Success"] == true) {
        plans.value = data["lstPlans"];
        loading.value = false;
      } else {
        plans.clear();
        loading.value = false;
      }
    } catch (e) {
      plans.clear();
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }
}
