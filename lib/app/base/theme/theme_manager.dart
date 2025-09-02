import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: AppTextThemes.workSansLight,
    dividerColor: AppColors.surfaceLight,
    dividerTheme: const DividerThemeData(thickness: 1),
  );

  static final appThemeDark = ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    brightness: Brightness.dark,
    textTheme: AppTextThemes.workSansDark,
    dividerColor: AppColors.surfaceDark,
    dividerTheme: const DividerThemeData(thickness: 1),
  );

  static const upwardsBoxShadow =  BoxShadow(
      color: Color.fromARGB(25, 21, 28, 42),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(0, -2));

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
      themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
      themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? AppColors.backgroundLight
          : AppColors.backgroundDark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

class AppColors {

  static const white = Colors.white;
  static const black = Colors.black;
  static Color grey500 = Colors.grey.shade500;
  static Color grey300 = Colors.grey.shade300;
  static Color grey200 = Colors.grey.shade200;
  static Color grey100 = Colors.grey.shade100;
  static const grey = Colors.grey;
  static Color yellow500 = Colors.yellow.shade500;
  static Color yellow100 = Colors.yellow.shade100;
  static const blue = Color(0xFF2196F3);
  static const red = Color(0xFFF44336);

  //My Added Colors

  static const Color primaryColor = Color(0xff031846);
  static const Color secondaryColor = Color(0xff02E8C2);
  static const Color darkPrimaryColor = Color(0xff050505);
  static const Color darkSecondaryColor = Color(0xff202020);
  static const Color whiteColor = Color(0xffffffff);
  static const Color grayStatusBarColor = Color(0xff636363);
  static const transparent = Color(0x00000000);
  static const canvasColor = Color(0xFF2E2E48);
  static Color messageButtonColor = Colors.indigoAccent.shade100;

  // Text Color
  static const Color primaryTextColor = Color(0xff2D3134);
  static const Color textColorBlue = Color(0xff031846);
  static const Color textColor = Color(0xff23233C);
  static const Color textGrayColor = Color(0xff8D8D8D);
  static const Color textChatHeaderColor = Color(0xff121213);
  static const Color textChatTimeColor = Color(0xff78849E);

  //FAB button Color
  static const Color fabButtonColor = Color(0xff14A1E8);

  //TextField Colors
  static const Color disabledBorderColor = Color(0xffC2C2C2);
  static const Color authHeaderDescriptionColor = Color(0xff616161);
  static const Color textFieldDisabledColor = Color(0xffBDBDBD);
  static const Color textFieldEnabledColor = Color(0xffEEEEEE);
  static const Color textFieldErrorColor = Color(0xffDC3535);
  static const Color textFieldHintColor = Color(0x8023233C);
  static const Color textSearchColor = Color(0xff919BBF);
  static const Color textSubscriptionColor = Color(0xff02C5D8);

  //Creativist App
  static const Color pageIndicatorColor = Color(0xff02E8C2);
  static const Color backgroundColor = Color(0xffC3F8EF);
  static const Color backgroundColorLight = Color(0xffF4FCFA);
  static const Color skipColor = Color(0xff031846);
  static const Color primaryScaffoldColor = Color(0xffF4FCFA);
  static const Color headerColor = Color(0xff132536);
  static const Color dropdownIconColor = Color(0xff3D3550);
  static const Color dottedBorderColor = Color(0xff979797);
  static const Color grayScaleScaffoldColor = Color(0xffF9F7F7);
  static const Color projectPreviewTitleColor = Color(0xff7A8FA6);
  static const Color projectPreviewTitleColorOP31 = Color(0x317A8FA6);
  static const Color uploadViewGradientLeftColor = Color(0xff02AAE8);
  static const Color tabBarBorderColor = Color(0xffB1B1B1);
  static const Color reviewDateColor = Color(0xffDAD5D5);
  static const Color reviewDotColor = Color(0xffF2F2F2);
  static const Color attachmentColor = Color(0xffF6F6F6);
  static const Color messageBoxColor = Color(0xff7A8FA6);
  static const Color receiveMessageBoxColor = Color(0xff02E8C2);
  static const Color lineColor = Color(0xff707070);

  //Taxi Driver
  static const Color toggleON = Color(0xFF4CAf50); //Green Color
  static const Color toggleOFF = Color(0xFFD6D6D6); //Grey Color

  //

  static const primary = Color(0xFFEBEBEB);
  // static const primary = Color(0xFFF0F0F0);
  static const secondary = Color(0xFF333333);
  static const secondaryShade = Color(0xFF71E8C4);
  /*static const secondary = Color(0xfface98f);
  static const secondaryShade = Color(0xFF71E8C4);*/

  static const buttonYellowColor = Color(0xFFF3BE25);

  //static const backgroundLight = surfaceLight;
  static const backgroundLight = Color(0xFFF4F4F4);
  static const backgroundDark = Color(0xFF1F2B2D);

  static const surfaceLight = Color(0xffdbdada);
  static const surfaceLight200 = Color(0xFF8D95A8);
  static const surfaceDark = Color(0xFF0E272D);

  static const labelColorLight = Color(0x993c3c43);

  static const coolGray1 = Color(0xFFf5f5f5);
  static const coolGray2 = Color(0xFFA8ABB1);
  static const coolGray3 = Color(0xFF454A54);

  static const iconColorLight = Color(0xFFF5F5F5);
  static const iconColorDark = Color(0xFF333333);

  static const divider = Color(0x400E282F);
  // static const dividerColor = Color(0xFF707070);
  static const dividerColor = Color(0xFF333326);

  static const error = Color(0xFFB00020);

  static const searchBarColor = Color(0x1F767680);

  static const lightBlack = Color(0xFF727272);
  static const darkGrey = Color(0xFFC1C1C6);
  static const lightGrey = Color(0xFFE2E2EC);
  static const lightYellow = Color(0xFFFCF4E4);

  static const bluetransparent = Color(0x9BB2E2);

  static const facebookBlue = Color(0xFF3A559F);
  static const darkBlue = Color(0xFF0341EC);
  static const blueLink = Color(0x000000EE);
  static const googleRed = Color(0xFFDC4E41);


  static const appSelectedContainerColor = Color(0xFF727272);
  static const borderColorGrey = Color(0xFF0000002B);
  static const buttonColorGrey = Color(0xFFCDCDCD);
  static const buttonColorGreyLight = Color(0xFFC8C8C878);

  static const textColorGrey = Color(0xFF707070);
  static const textColorGreyLight = Color(0xFFAAAAAA);
  static const textColorGreen = Color(0xFF2F911E);
  static const textColorRed = Color(0xFFFF0000);

  static const onlineColor = Color(0xFF81C784);
  static const offlineColor = Color(0xFFE57373);

  static const statusBarColor = Color(0xFFFAFAFA);

}

class Dimensions {

  static const double width_2dp = 2.0;
  static const double width_4dp = 4.0;
  static const double width_6dp = 6.0;
  static const double width_8dp = 8.0;
  static const double width_10dp = 10.0;
  static const double width_12dp = 12.0;
  static const double width_14dp = 14.0;
  static const double width_16dp = 16.0;
  static const double width_20dp = 20.0;
  static const double width_24dp = 24.0;
  static const double width_28dp = 28.0;
  static const double width_32dp = 32.0;
  static const double width_40dp = 40.0;
  static const double width_50dp = 50.0;
  static const double width_48dp = 48.0;
  static const double width_70dp = 70.0;
  static const double width_100dp = 100.0;
  static const double width_200dp = 200.0;

  static const double height_2dp = 2.0;
  static const double height_4dp = 4.0;
  static const double height_6dp = 6.0;
  static const double height_8dp = 8.0;
  static const double height_10dp = 10.0;
  static const double height_12dp = 12.0;
  static const double height_14dp = 14.0;
  static const double height_16dp = 16.0;
  static const double height_20dp = 20.0;
  static const double height_24dp = 24.0;
  static const double height_28dp = 28.0;
  static const double height_30dp = 30.0;
  static const double height_32dp = 32.0;
  static const double height_40dp = 40.0;
  static const double height_50dp = 50.0;
  static const double height_60dp = 60.0;
  static const double height_48dp = 48.0;
  static const double height_70dp = 70.0;
  static const double height_80dp = 80.0;
  static const double height_90dp = 90.0;
  static const double height_100dp = 100.0;
  static const double height_110dp = 110.0;
  static const double height_120dp = 120.0;
  static const double height_140dp = 140.0;
  static const double height_150dp = 150.0;
  static const double height_200dp = 200.0;
  static const double height_300dp = 300.0;

  static const double margin_2dp = 2;
  static const double margin_4dp = 4;
  static const double margin_6dp = 6;
  static const double margin_8dp = 8;
  static const double margin_10dp = 10.0;
  static const double margin_12dp = 12.0;
  static const double margin_16dp = 16.0;
  static const double margin_18dp = 18.0;
  static const double margin_20dp = 20.0;
  static const double margin_24dp = 24.0;
  static const double margin_28dp = 28.0;
  static const double margin_32dp = 32.0;
  static const double margin_40dp = 40.0;
  static const double margin_48dp = 48.0;
  static const double margin_60dp = 60.0;
  static const double margin_70dp = 70.0;
  static const double margin_80dp = 80.0;
  static const double margin_100dp = 100.0;

  static const double padding_2dp = 2.0;
  static const double padding_4dp = 4.0;
  static const double padding_6dp = 6.0;
  static const double padding_8dp = 8.0;
  static const double padding_10dp = 10.0;
  static const double padding_12dp = 12.0;
  static const double padding_14dp = 14.0;
  static const double padding_16dp = 16.0;
  static const double padding_20dp = 20.0;
  static const double padding_24dp = 24.0;
  static const double padding_32dp = 32.0;
  static const double padding_40dp = 40.0;
  static const double padding_50dp = 50.0;
  static const double padding_48dp = 48.0;
  static const double padding_70dp = 70.0;
  static const double padding_200dp = 200.0;

  static const double font_8sp = 8.0;
  static const double font_10sp = 10.0;
  static const double font_12sp = 12.0;
  static const double font_14sp = 14.0;
  static const double font_16sp = 16.0;
  static const double font_18sp = 18.0;
  static const double font_20sp = 20.0;
  static const double font_22sp = 22.0;
  static const double font_24sp = 24.0;
  static const double font_28sp = 28.0;

  static const double radius_10dp = 10;
  static const double radius_8dp = 8;
  static const double radius_6dp = 6;
  static const double radius_4dp = 4;
  static const double radius_12dp = 12;
  static const double radius_14dp = 14;
  static const double radius_16dp = 16;
  static const double radius_24dp = 24;

  static const double pb_width_48dp = 48;
  static const double pb_height_48dp = 48;

  static const double et_width_70dp = 70;
  static const double et_width_100dp = 100;
  static const double et_width_150dp = 150;

  static const double et_height_32dp = 32;
  static const double et_height_40dp = 40;
  static const double et_height_50dp = 50;

  static const double btn_width_32dp = 32;
  static const double btn_width_40dp = 40;
  static const double btn_width_48dp = 48;
  static const double btn_width_90dp = 90;
  static const double btn_width_150dp = 150;
  static const double btn_width_110dp = 110;
  static const double btn_width_200dp = 200;

  static const double btn_height_32dp = 32;
  static const double btn_height_40dp = 40;
  static const double btn_height_48dp = 48;

  static const double elevation_8dp = 8;

  static const double avatar_radius_15dp = 15;
  static const double avatar_radius_20dp = 20;
  static const double avatar_radius_48dp = 48;
  static const double avatar_radius_56dp = 56;
  static const double avatar_radius_100dp = 100;

  static const double avatar_width_40dp = 40;
  static const double avatar_width_90dp = 90;
  static const double avatar_width_100dp = 100;

  static const double avatar_height_40dp = 40;
  static const double avatar_height_90dp = 90;
  static const double avatar_height_100dp = 100;

  static const double toolbar_height = 56;
  static const double tab_bar_height = 56;

  //static const double bottom_nav_bar_height = 60;
  static const double bottom_nav_bar_height = 60;
  static const double stepper_height = 124;

  static const double divider_height_1dp = 1;
  static const double divider_height_3dp = 3;
  static const double divider_height_02dp = 0.2;

  static const double border_1dp = 1;
  static const double border_1_5dp = 1.5;
  static const double border_2dp = 2;

  static const double placeholder_size_48dp = 48;

  static const double icon_size_16 = 16;

  static const double dialog_max_width = 500;
  static const double alert_dialog_max_width = 200;
}

class AppTextThemes {
  static TextTheme workSansLight = textThemeLight;
  // GoogleFonts.workSansTextTheme(Theme.of(context).textTheme);
  // GoogleFonts.workSansTextTheme(textThemeLight);
  // static TextTheme workSansDark = GoogleFonts.workSansTextTheme(textThemeDark);
  static TextTheme workSansDark = textThemeDark;

  static TextTheme textThemeLight = TextTheme(
    displayLarge: h1,
    displayMedium: h2,
    displaySmall: h3,
    headlineLarge: h4,
    headlineMedium: h5,
    headlineSmall: h6,
    titleMedium: subtitle1,
    titleSmall: subtitle2,
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
    bodySmall: caption,
    labelLarge: button,
    labelSmall: overline,
  );

  static TextTheme textThemeDark = TextTheme(
    displayLarge: h1Dark,
    displayMedium: h2Dark,
    displaySmall: h3Dark,
    headlineLarge: h4Dark,
    headlineMedium: h5Dark,
    headlineSmall: h6Dark,
    titleMedium: subtitle1Dark,
    titleSmall: subtitle2Dark,
    bodyLarge: bodyTextDark,
    bodyMedium: bodyText2Dark,
    bodySmall: captionDark,
    labelLarge: buttonDark,
    labelSmall: overlineDark,
  );

  static final h1 = const TextStyle(
      fontSize: 48, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h2 = const TextStyle(
      fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h3 = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h4 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h5 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h6 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.black);
  static final subtitle1 = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.black);

  //static final bodyText1 = TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black);
  static final bodyText1 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black);
  static final bodyText2 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black);
  static final button = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.white);
  static final subtitle2 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.black);
  static final caption = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black);
  static final overline = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      letterSpacing: 0.1);

  static final labelStyle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondary);

  static final h1Dark = h1.copyWith(color: AppColors.white);
  static final h2Dark = h2.copyWith(color: AppColors.white);
  static final h3Dark = h3.copyWith(color: AppColors.white);
  static final h4Dark = h4.copyWith(color: AppColors.white);
  static final h5Dark = h5.copyWith(color: AppColors.white);
  static final h6Dark = h6.copyWith(color: AppColors.white);
  static final subtitle1Dark = subtitle1.copyWith(color: AppColors.white);
  static final bodyTextDark = bodyText1.copyWith(color: AppColors.white);
  static final bodyText2Dark = bodyText2.copyWith(color: AppColors.white);
  static final buttonDark = button.copyWith();
  static final subtitle2Dark = subtitle2.copyWith(color: AppColors.white);
  static final captionDark = caption.copyWith(color: AppColors.white);
  static final overlineDark = overline.copyWith(color: AppColors.white);
}

extension ThemeExtras on ThemeData {
  Color get appBarColor => this.brightness == Brightness.light
      ? AppColors.primary
      : AppColors.surfaceDark;

  Color get navBarColor => this.brightness == Brightness.light
      ? AppColors.surfaceLight
      : AppColors.surfaceDark;

  Color get textFieldBackgroundColor => this.brightness == Brightness.light
      ? AppColors.surfaceLight
      : AppColors.surfaceDark;

  Color get iconColor => this.brightness == Brightness.light
      ? AppColors.iconColorDark
      : AppColors.iconColorLight;

  TextStyle get labelStyle =>
      AppTextThemes.bodyText2.copyWith(color: AppColors.secondary);
}
