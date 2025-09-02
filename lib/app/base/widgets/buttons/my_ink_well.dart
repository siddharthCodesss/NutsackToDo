import 'package:flutter/material.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/theme/theme_manager.dart';

class MyInkWell extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  final double borderRadius;
  final Color? backgroundColor;

  const MyInkWell({
    required this.onTap,
    required this.child,
    this.borderRadius = Dimensions.radius_8dp,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: backgroundColor ?? Colors.transparent,
            child: InkWell(
              splashFactory: null,
              onTap: onTap,
              borderRadius: BorderRadius.circular(borderRadius),
              splashColor: ColorConstants.canvasColor.withOpacity(0.3),
            ),
          ),
        ),
      ],
    );
  }
}
