import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/theme/theme_manager.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildUI(context);
  }

  Widget buildUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
                  primary: ColorConstants.primaryColor,
                  // You should set other properties too
                )),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.primaryColor),
                backgroundColor: kIsWeb
                    ? Colors.transparent
                    : Platform.isAndroid
                    ? ColorConstants.secondaryColor
                    : ColorConstants.secondaryColor,
              ),
            ),
          ),
          const SizedBox(height: Dimensions.margin_8dp),
        ],
      ),
    );
  }

/*Map<String, Color> getProgressColor = {
    'android': Colors.transparent,
    'ios': AppColors.secondary,
    'macos': Colors.transparent,
    'windows': Colors.transparent,
  };*/
}
