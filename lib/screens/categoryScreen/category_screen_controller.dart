import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;

class CategoryScreenController extends GetxController {
  final storage = GetStorage();
  RxList categoryList = [].obs;
  RxBool loading = false.obs;

  Future<dynamic> getMainCategories() async {
    try {
      loading.value = true;
      var response = await http.post(Uri.parse(ApiServices.GetCategories), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID), "SendMaster": true}));
      print('getMainCategories Response status: ${response.statusCode}');
      print('getMainCategories Response body: ${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["Success"] == true) {
        categoryList.value = data["lstCat"];
        loading.value = false;
      } else {
        categoryList.clear();
        loading.value = false;
      }
    } catch (e) {
      categoryList.clear();
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }
}
