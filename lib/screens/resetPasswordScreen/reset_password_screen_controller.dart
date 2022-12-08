import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:sarvam/network/api_services.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:http/http.dart' as http;

class ResetPasswordScreenController extends GetxController {
  final storage = GetStorage();

}
