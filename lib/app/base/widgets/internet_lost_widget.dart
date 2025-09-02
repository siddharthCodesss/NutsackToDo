import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:nutsacktodo/app/base/constants/app_constants.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/constants/font_constants.dart';

class InternetLostWidget extends StatelessWidget {
  const InternetLostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(4.w),
      color: ColorConstants.pendingStateColor.withOpacity(0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.wifi_off_sharp,
            size: 4.w,
            color: ColorConstants.pendingStateColor,
          ).marginOnly(right: 2.w),
          Flexible(
            child: Text(
              AppConstants.currentlyOffline,
              style: TextStyle(
                  fontFamily: tertiaryFont,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: ColorConstants.pendingStateColor),
            ),
          )
        ],
      ),
    ).marginOnly(bottom: 4.w);
  }
}
