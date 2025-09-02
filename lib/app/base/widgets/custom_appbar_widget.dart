import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/constants/font_constants.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actionWidget;
  CustomAppBarWidget({super.key, required this.title, this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.backgroundColor,
      foregroundColor: ColorConstants.backgroundColor,
      surfaceTintColor: ColorConstants.backgroundColor,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: primaryFont,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: ColorConstants.textColorPrimary),
      ),
      actions: [
        actionWidget ?? const SizedBox.shrink()
      ],
      bottom: PreferredSize(
          preferredSize: Size(100.w, 1.5),
          child: Container(
            width: 100.w,
            height: 1,
            margin: EdgeInsets.only(top: 2),
            color: Colors.grey.shade300,
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
