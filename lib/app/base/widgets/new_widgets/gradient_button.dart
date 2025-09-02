import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';

class GradientButton extends StatelessWidget {
  final String? buttonText;
  final Function()? onTap;
  const GradientButton({super.key, this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 11.w,
        width: 60.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              ColorConstants.cyanTeal,
              ColorConstants.electricPurple,
              ColorConstants.neonPink,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: ColorConstants.cyanTeal.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(-5, 0),
            ),
            BoxShadow(
              color: ColorConstants.neonPink.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(5, 0),
            ),
          ],
        ),
        child: Center(
          child: Container(
            height: 10.w,
            width: 59.w,
            decoration: BoxDecoration(
                color: ColorConstants.dark,
                borderRadius: BorderRadius.circular(30.0)
            ),
            child: Center(
                child: Text(
                  buttonText ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 20, shadows: [
                    Shadow(
                      color: Colors.red.withOpacity(0.8),
                      blurRadius: 10.0,
                    ),
                    // Shadow 2: The softer, outer halo
                    Shadow(
                      color: Colors.red.withOpacity(0.8),
                      blurRadius: 10.0,
                    ),
                    // Shadow 3: A brighter core glow (optional but effective)
                    Shadow(
                      color: Colors.pink.withOpacity(0.9),
                      blurRadius: 10.0,
                    ),
                  ]),
                )
            ),
          ),
        ),
      ),
    );
  }
}
