import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutsacktodo/app/base/constants/size_constants.dart';

import '../../theme/theme_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  TextInputType? keyboardType;
  int? maxLines = 1;
  int? maxLength;
  String hintText;
  String? errorText;
  ValueChanged<String>? onChange;
  TextEditingController? controller;
  bool? obscureText;

  CustomTextFieldWidget(this.keyboardType, this.maxLines, this.maxLength, this.hintText,
      this.obscureText, this.controller, this.errorText, this.onChange);

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
        fillColor: AppColors.white,
        hintText: hintText,
        errorText: errorText != null ? '$errorText' : null,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        errorBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2.0, color: Colors.black),
        ),
        errorStyle: const TextStyle(color: Colors.red),
        counter: SizedBox(
          width: SizeConstants.size0,
          height: SizeConstants.size0,
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2.0, color: Colors.black),
        ),
      ),
    );
  }
}
