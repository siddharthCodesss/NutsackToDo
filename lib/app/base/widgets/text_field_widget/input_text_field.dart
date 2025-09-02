import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  TextInputType? keyboardType;
  int? maxLines = 1;
  String hintText;
  String? errorText;
  ValueChanged<String>? onChange;
  TextEditingController? controller;
  bool? obscureText;

  InputTextField(this.keyboardType, this.maxLines, this.hintText,
      this.obscureText, this.controller, this.errorText, this.onChange);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // style: GoogleFonts.poppins(
      //     textStyle: context.textTheme.bodyLarge!),
      // style: context.textTheme.bodyText1,
      onChanged: onChange,
      keyboardType: keyboardType,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        // hintStyle: GoogleFonts.poppins(
        //     textStyle: context.textTheme.bodyLarge!.copyWith(color: ColorConstants.textFieldHintColor,),height: 1.0),
        errorText: errorText != null ? '$errorText' : null,
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius:  BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius:  BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
