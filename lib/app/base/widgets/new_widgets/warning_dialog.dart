import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/widgets/new_widgets/gradient_button.dart';
import 'package:sizer/sizer.dart';

class WarningDialog extends StatelessWidget {
  final String? message;
  final String? buttonText;
  final Function()? onTap;
  const WarningDialog({super.key, this.message, this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 40.w,
          width: 80.w,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorConstants.dark,
              border: Border.all(color: ColorConstants.neonPink, width: 1),
              boxShadow: const [
                BoxShadow(
                    color: ColorConstants.warningOrange,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message ?? '',
                style: TextStyle(color: Colors.white, fontSize: 20, shadows: [
                  Shadow(
                    color: Colors.red.withOpacity(0.8),
                    blurRadius: 10.0,
                  ),
                  // Shadow 2: The softer, outer halo
                  Shadow(
                    color: Colors.red.withOpacity(0.8),
                    blurRadius: 20.0,
                  ),
                  // Shadow 3: A brighter core glow (optional but effective)
                  Shadow(
                    color: Colors.pink.withOpacity(0.9),
                    blurRadius: 30.0,
                  ),
                ]),
              ).marginOnly(bottom: 4.w),
              GradientButton(buttonText: buttonText, onTap: onTap,)
            ],
          ),
        ),
      ),
    );
  }
}
