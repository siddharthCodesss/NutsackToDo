// light_dark_theme.dart

import 'package:flutter/material.dart';
import 'package:nutsacktodo/app/base/constants/size_constants.dart';
import '../constants/color_constants.dart';

// To set theme for light mode
ThemeData lightThemeData() => ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 10.0,
    foregroundColor: Colors.white,
    backgroundColor: ColorConstants.primaryColor,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: ColorConstants.backgroundColor,
    textStyle: lightPopupMenuTextStyle(),
  ),
  radioTheme: RadioThemeData(
    fillColor:
    MaterialStateProperty.all<Color>(ColorConstants.primaryColor),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
    MaterialStateProperty.all<Color>(ColorConstants.primaryColor),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: ColorConstants.backgroundColor,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: ColorConstants.backgroundColor,
  ),
  scaffoldBackgroundColor: ColorConstants.backgroundColor,
  brightness: Brightness.light,
  primaryColor: ColorConstants.primaryColor,
  cardColor: ColorConstants.cardBackgroundColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: ColorConstants.textColorPrimary,
      fontWeight: SizeConstants.fontWeightRegular,
      fontSize: SizeConstants.size14,
    ),
    bodyMedium: TextStyle(
      color: ColorConstants.textColorSecondary,
      fontWeight: SizeConstants.fontWeightRegular,
      fontSize: SizeConstants.size12,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Poppins',
);

// To set theme for dark mode
ThemeData darkThemeData() => ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 10.0,
    foregroundColor: Colors.white,
    backgroundColor: ColorConstants.primaryColor,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: const Color(0xff1F2937), // dark surface
    textStyle: darkPopupMenuTextStyle(),
  ),
  radioTheme: RadioThemeData(
    fillColor:
    MaterialStateProperty.all<Color>(ColorConstants.primaryColor),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
    MaterialStateProperty.all<Color>(ColorConstants.primaryColor),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xff111827), // darker bg
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xff111827),
  ),
  scaffoldBackgroundColor: const Color(0xff111827),
  brightness: Brightness.dark,
  primaryColor: ColorConstants.primaryColor,
  cardColor: const Color(0xff1F2937),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Poppins',
);

// Popupmenu style for light mode
TextStyle lightPopupMenuTextStyle() => TextStyle(
  color: ColorConstants.textColorPrimary,
  fontWeight: SizeConstants.fontWeightRegular,
  fontSize: SizeConstants.size14,
);

// Popupmenu style for dark mode
TextStyle darkPopupMenuTextStyle() => TextStyle(
  color: Colors.white,
  fontWeight: SizeConstants.fontWeightRegular,
  fontSize: SizeConstants.size14,
);
