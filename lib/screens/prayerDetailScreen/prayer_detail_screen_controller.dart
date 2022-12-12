import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;

class PrayerDetailScreenController extends GetxController {
  final storage = GetStorage();
  RxBool loading = false.obs;
  final contentDetails = <String, dynamic>{}.obs;

  Future<dynamic> getContentDetails({required int? contentID}) async {
    try {
      print('getContentDetails input Data $contentID');
      loading.value = true;
      var response = await http.post(Uri.parse(ApiServices.GetContentDetails), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID), "ContentID": contentID}));
      print('getContentDetails Response status: ${response.statusCode}');
      print('getContentDetails Response body: ${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["Success"] == true) {
        loading.value = false;
        contentDetails.value = data;
      } else {
        loading.value = false;
        contentDetails.value = {};
      }
    } catch (e) {
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }
}