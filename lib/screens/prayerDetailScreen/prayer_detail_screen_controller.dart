import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;
import 'package:sarvam/widgets/loading_view.dart';

class PrayerDetailScreenController extends GetxController {
  final storage = GetStorage();
  RxBool loading = false.obs;
  final contentDetails = <String, dynamic>{}.obs;
  RxList commentList = [].obs;

  Future<dynamic> getContentDetails({required int contentID}) async {
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
        commentList.value = data["lstComment"];
      } else {
        loading.value = false;
        contentDetails.value = {};
        commentList.clear();
      }
    } catch (e) {
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }

  Future<dynamic> addComment({required int contentID, required String commentMsg, bool isLoading = true}) async {
    print('addComment input Data $contentID');
    print('addComment input Data $commentMsg');
    if (isLoading) {
      Get.dialog(LoadingDialog(), barrierDismissible: false);
    }
    var response = await http.post(Uri.parse(ApiServices.addComment), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID), "ContentID": contentID, "Msg": commentMsg}));
    print('addComment Response body: ${response.body}');
    if (isLoading && Get.isDialogOpen!) {
      Get.back();
    }
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data["Success"] == true) {
      var commentData = await http.post(Uri.parse(ApiServices.GetContentDetails), headers: {"Content-Type": "application/json"}, body: jsonEncode({"APIKey": API_KEY, "CallFrom": PLATFORM, "UserID": storage.read(USER_ID), "ContentID": contentID}));
      var commentResponseData = jsonDecode(commentData.body);
      if (commentData.statusCode == 200 && commentResponseData["Success"] == true) {
        commentList.value = commentResponseData["lstComment"];
      }
    } else {
      commentList.clear();
    }
  }
}
