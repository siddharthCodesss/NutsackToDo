import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

class TextRubikWidget extends StatelessWidget {
  final Color textColor;
  final TextDecoration? textDecoration;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final bool? overflow;

  TextRubikWidget({
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
    return Container(
      child: Text(
        text,
        // style: GoogleFonts.rubik(
        //     textStyle: context.textTheme.bodyLarge!.copyWith(fontSize: fontSize, color: textColor, fontWeight: fontWeight, decoration: textDecoration)),
        textAlign: textAlign == null ? TextAlign.center : textAlign,
        overflow: (overflow ?? true) ? TextOverflow.visible : TextOverflow.ellipsis,
      ),
    );
  }
}
