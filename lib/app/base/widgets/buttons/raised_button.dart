import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RaisedRectButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Widget textWidget;
  // final String textWidget;
  final double width;
  final double height;
  final double radius;
  final double textTBPadding;
  final Function()? onPressed;

  RaisedRectButton({
    this.backgroundColor = Colors.amber,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    required this.textWidget,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: textTBPadding,
              ),
              child: textWidget,
            ),
          ],
        ),
      ),
    );
  }
}
