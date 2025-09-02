import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nutsacktodo/app/base/theme/theme_manager.dart';

class RaisedRectWithBorderButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Widget textWidget;
  final Widget imageWidget;

  // final String textWidget;
  final double width;
  final double height;
  final double radius;
  final double textTBPadding;
  final Function()? onPressed;

  RaisedRectWithBorderButton({
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    required this.textWidget,
    required this.imageWidget,
    this.width = double.infinity,
    this.height = 60,
    this.radius = 10,
    this.textTBPadding = 8,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
        splashColor: backgroundColor,
        color: backgroundColor,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(
              width: Dimensions.width_20dp,
            ),
            imageWidget,
            const SizedBox(
              width: Dimensions.width_32dp,
            ),
            textWidget
          ],
        ),
      ),
    );
  }
}
