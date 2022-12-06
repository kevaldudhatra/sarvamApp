// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';

class CustomButton extends StatefulWidget {

  Function()? onTap;
  Color? borderColor;
  Color? buttonColor;
  Color? labelColor;
  String? label;
  double? fontSize;

  CustomButton({
    Key? key,
    this.onTap,
    this.borderColor,
    this.buttonColor,
    this.labelColor,
    this.label,
    this.fontSize
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(color: widget.buttonColor ?? backgroundWhite, border: Border.all(color: widget.borderColor ?? Colors.white, width: 1), borderRadius: BorderRadius.circular(35)),
        child: Center(
          child: Text(
            widget.label ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: widget.fontSize ?? 16,fontFamily: INTER_SEMI_BOLD,color: widget.labelColor ?? Colors.black),
          ),
        ),
      ),
    );
  }
}
