import 'package:flutter/material.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/utils/dialog_utils/alert_dialog/app_alert_dialog.dart';
import 'package:nutsacktodo/app/base/utils/helper_util.dart';
import 'package:nutsacktodo/app/base/widgets/new_widgets/success_dialog.dart';
import 'package:nutsacktodo/app/base/widgets/new_widgets/warning_dialog.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          ColorConstants.primaryDark,
          ColorConstants.tertiaryDark,
          ColorConstants.dark
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: SuccessDialog(message: "Are you sure?", buttonText: "Skip", onTap: () {},)
        ),
      ),
    );
  }
}
