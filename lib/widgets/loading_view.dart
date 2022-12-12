// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sarvam/utils/const_image_key.dart';

class LoadingDialog  extends StatefulWidget {
  LoadingDialog({Key? key, this.color = Colors.transparent, this.width = 250.0, this.height = 250.0}) : super(key: key);
  Color? color = Colors.transparent;
  double? width = 250.0;
  double? height = 250.0;
  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Center(
        child: Lottie.asset(AppImages().loading,height: widget.height,width: widget.width),
      ),
    );
  }
}
