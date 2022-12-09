import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:http/http.dart' as http;

class SubscriptionScreenController extends GetxController {
  final storage = GetStorage();

  Future<dynamic> getPlans({bool isLoading = true}) async {
    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }
    var response = await http.post(Uri.parse(ApiServices.GetPlans), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM}));
    print('getPlans Response status: ${response.statusCode}');
    print('getPlans Response body: ${response.body}');
    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      return data["lstPlans"];
    } else {
      return null;
    }
  }
}
