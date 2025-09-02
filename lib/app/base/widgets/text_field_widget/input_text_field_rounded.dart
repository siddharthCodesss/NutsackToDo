import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';

import '../../constants/size_constants.dart';
import '../../theme/theme_manager.dart';

class InputTextFieldRounded extends StatelessWidget {
  TextInputType? keyboardType;
  int? maxLines = 1;
  int? maxLength;
  String? hintText;
  String? errorText;
  ValueChanged<String>? onChange;
  TextEditingController? controller;
  bool? obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? borderColor;
  Color? backgroundColor;
  double? borderWidth;

  InputTextFieldRounded({this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.hintText,
    this.obscureText,
    this.controller,
    this.errorText,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.backgroundColor,
    this.borderWidth
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: context.textTheme.bodyLarge,
      onChanged: onChange,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? AppColors.grey100,
        hintText: hintText,
        errorText: errorText != null ? '$errorText' : null,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? ColorConstants.textFieldHintColor),
            borderRadius: const BorderRadius.all(Radius.circular(14))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? ColorConstants.textFieldHintColor),
            borderRadius: const BorderRadius.all(Radius.circular(14))),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
              width: borderWidth ?? 2.0, color: borderColor ?? ColorConstants.textFieldHintColor),
        ),
        errorStyle: const TextStyle(color: Colors.red),
        counter: SizedBox(
          width: SizeConstants.size0,
          height: SizeConstants.size0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
              width: borderWidth ?? 2.0, color: borderColor ?? ColorConstants.textFieldHintColor),
        ),
      ),
    );
  }
}
