import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;

class PrayerScreenController extends GetxController {
  final storage = GetStorage();
  RxList contentList = [].obs;
  RxBool loading = false.obs;

  Future<dynamic> getContent({required int? subCatID}) async {
    try {
      print('getContent input Data $subCatID');
      loading.value = true;
      var response = await http.post(Uri.parse(ApiServices.GetContent), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID), "SubCatID": subCatID}));
      print('getContent Response status: ${response.statusCode}');
      print('getContent Response body: ${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["Success"] == true) {
        contentList.value = data["lstContent"];
        loading.value = false;
      } else {
        contentList.clear();
        loading.value = false;
      }
    } catch (e) {
      contentList.clear();
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }
}
