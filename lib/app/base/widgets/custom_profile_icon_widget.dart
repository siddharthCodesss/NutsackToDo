import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';

class CustomProfileIconWidget extends StatelessWidget {
  const CustomProfileIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.w,
      width: 10.w,
      margin: EdgeInsets.only(right: 4.w),
      decoration: BoxDecoration(
          color: ColorConstants.secondaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.w)),
      child: Center(
        child: Icon(
          Icons.person_4_outlined,
          color: ColorConstants.primaryColor,
        ),
      ),
    );
  }
}