import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextPoppinsWidget extends StatelessWidget {
  final Color textColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final bool? overflow;
  final TextDecoration? textDecoration;

  TextPoppinsWidget({
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    this.textDecoration,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // style: GoogleFonts.poppins(
      //     textStyle: context.textTheme.bodyLarge!.copyWith(
      //         fontSize: fontSize, color: textColor, fontWeight: fontWeight, decoration: textDecoration)),
      textAlign: textAlign ?? TextAlign.center,
      overflow: (overflow ?? true) ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
