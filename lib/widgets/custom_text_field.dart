// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';

class CustomTextField extends StatefulWidget {
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  String? hint = "";
  TextInputType? keyboardType = TextInputType.text;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction = TextInputAction.done;
  bool? obscureText = false;
  TextAlign? textAlign = TextAlign.start;
  double? contentPaddingTop = 0.0;
  double? contentPaddingBottom = 0.0;
  double? contentPaddingLeft = 15.0;
  double? contentPaddingRight = 15.0;
  double? fontSize;
  int? maxLength;
  Color? hintColor = textBlack.withOpacity(0.50);
  Color? fontColor = textBlack;
  TextEditingController? textEditingController = TextEditingController(text: "");
  bool? readOnly;
  int? maxLine;

  CustomTextField({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.hint,
    this.textInputAction,
    this.textEditingController,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.textAlign,
    this.contentPaddingTop = 0.0,
    this.contentPaddingBottom = 0.0,
    this.contentPaddingLeft = 15.0,
    this.contentPaddingRight = 15.0,
    this.fontSize,
    this.hintColor,
    this.fontColor,
    this.maxLength,
    this.readOnly = false,
    this.maxLine,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLine,
      controller: widget.textEditingController ?? TextEditingController(text: ""),
      autocorrect: true,
      readOnly: widget.readOnly ?? false,
      onChanged: widget.onChanged ?? (values) {},
      onSubmitted: widget.onSubmitted ?? (values) {},
      maxLength: widget.maxLength,
      textAlign: widget.textAlign ?? TextAlign.start,
      obscureText: widget.obscureText ?? false,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      inputFormatters: widget.inputFormatters ?? [],
      style: TextStyle(color: widget.fontColor ?? textBlack, fontSize: widget.fontSize ?? 18.0, fontFamily: ROBOTO_REGULAR),
      cursorColor: textBlack,
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hint ?? "",
        contentPadding: EdgeInsets.only(
          bottom: widget.contentPaddingBottom!,
          top: widget.contentPaddingTop!,
          left: widget.contentPaddingLeft!,
          right: widget.contentPaddingRight!,
        ),
        hintStyle: TextStyle(color: widget.hintColor ?? textBlack.withOpacity(0.5), fontSize: widget.fontSize ?? 18.0, fontFamily: ROBOTO_REGULAR),
        filled: true,
        fillColor: backgroundWhite,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
