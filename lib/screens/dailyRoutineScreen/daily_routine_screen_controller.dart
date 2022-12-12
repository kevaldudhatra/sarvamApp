import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;

class DailyRoutineScreenController extends GetxController {
  final storage = GetStorage();
  RxList subCategoryList = [].obs;
  RxBool loading = false.obs;

  Future<dynamic> getSubCategories({required int? catId}) async {
    try {
      print('getSubCategories input Data $catId');
      loading.value = true;
      var response = await http.post(Uri.parse(ApiServices.GetSubCategories), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID), "CatID": catId}));
      print('getSubCategories Response status: ${response.statusCode}');
      print('getSubCategories Response body: ${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data["Success"] == true) {
        subCategoryList.value = data["lstSubCat"];
        loading.value = false;
      } else {
        subCategoryList.clear();
        loading.value = false;
      }
    } catch (e) {
      subCategoryList.clear();
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }
}
