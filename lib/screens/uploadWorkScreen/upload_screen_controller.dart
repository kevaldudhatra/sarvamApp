import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:http/http.dart' as http;

class UploadScreenController extends GetxController {
  final storage = GetStorage();

  Future<dynamic> uploadMedia({required int contentID, required String workName, required String workDescription, required PlatformFile mediaFile}) async {
    try {
      print('uploadMedia input Data $contentID');
      print('uploadMedia input Data $workName');
      print('uploadMedia input Data $workDescription');
      print('uploadMedia input Data ${mediaFile.path}');
      var request = http.MultipartRequest("POST",Uri.parse("https://sarvam.whizapps.in/API/UploadWork.ashx"));
      request.headers.addAll({"Content-Type":"multipart/form-data"});
      request.files.add(await http.MultipartFile.fromPath("File",mediaFile.path!));
      request.fields["APIKey"]=API_KEY;
      request.fields["CallFrom"]=PLATFORM;
      request.fields["UserID"]=storage.read(USER_ID);
      request.fields["ContentID"]="$contentID";
      request.fields["Name"]=workName;
      request.fields["Desp"]=workDescription;
      var response =await request.send();
      print('uploadMedia Response status: ${response.statusCode}');
      print('uploadMedia Response body: ${response.stream.bytesToString()}');
      // var data = jsonDecode(response);
      // if (response.statusCode == 200 && data == "Success") {
      // print("UPLOAD SUCCESS");
      // } else {
      //   print("UPLOAD FAILED");
      // }
    } catch (e) {
      print(e);
    }
  }
}
