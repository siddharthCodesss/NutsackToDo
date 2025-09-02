import 'dart:math' as math;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/theme/theme_manager.dart';
import 'package:nutsacktodo/app/base/utils/dialog_utils/alert_dialog/app_alert_dialog.dart';
import 'package:nutsacktodo/app/base/utils/dialog_utils/loading/app_progress_dialog.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../router/router.dart';

enum ConfirmAction { CANCEL, OK }

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

extension CapExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String dashAfter3() {
    String temp1 = this;
    String op = '';
    for (int i = 0; i < temp1.length; i++) {
      if (i % 3 == 0 && i != 0 && i + 3 <= temp1.length)
        op += '-' + temp1[i];
      else
        op += temp1[i];
    }
    return op;
  }
}

class Helper {
  static AppProgressDialog? pr;

  Helper(BuildContext context) {
    pr = AppProgressDialog(context, ProgressDialogType.Normal);
  }

  static double getToolbarStatusBarHeightWithMarginTop(BuildContext context) {
    return Dimensions.toolbar_height;
  }

  static double getToolbarStatusBarHeight(BuildContext context) {
    return Dimensions.toolbar_height + 1;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static showLoadingDialog(BuildContext context, String message) {
    if (pr != null && pr!.isShowing()) {
    } else {
      pr = AppProgressDialog(context, ProgressDialogType.Normal);
      pr!.showLoadingDialog(message);
    }
  }

  static hideLoadingDialog() {
    if (pr != null && pr!.isShowing()) {
      pr!.hide();
    }
  }

  static void showAlertDialog(BuildContext c, String heading,
      {String? body, String? textOKBtn}) {
    String text = "Ok";

    if (body == null) {
      showDialog(
        context: c,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              heading,
              style: c.textTheme.bodyLarge,
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text(text),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: c,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(heading, style: c.textTheme.bodyLarge),
            content: Text(body, style: c.textTheme.bodyLarge),
            actions: <Widget>[
              TextButton(
                child: Text(text),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  static void showAlertDialogWithOnTap(
      BuildContext context, String? heading, Function() onTap,
      {String? textOKBtn = 'OK', String? textCancelBtn = 'Cancel'}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AppAlertDialog(heading!, onTap),
    );
  }

  static void showSnackBar(String message) {
    Get.snackbar('', message,
        duration: const Duration(seconds: 2),
        colorText: ColorConstants.backgroundColor,
        backgroundColor: ColorConstants.primaryColor);
  }

  static ToastFuture toast(String message) {
    return showToast(
      "$message",
      duration: const Duration(seconds: 2),
      position: ToastPosition.bottom,
      backgroundColor: Colors.white.withOpacity(0.8),
      radius: 13.0,
    );
  }

  static String minutesToHHmm(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    var hhmm = '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    if (hhmm.contains("-")) {
      hhmm = hhmm.substring(1);
    }
    return hhmm;
  }

  static String stringMinutesToHHmm(String minutes) {
    List<String> parts = minutes.toString().split(':');
    var hhmm = '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    if (hhmm.contains("-")) {
      hhmm = hhmm.substring(1);
    }
    return hhmm;
  }

  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    try {
      var num = double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  static String roundDecimalValue(String value) {
    printWrapped('before.........$value');
    var doubleValue = double.parse(value);
    var roundValue = doubleValue.toStringAsFixed(2);
    printWrapped('after.........$roundValue');
    //return double.parse(roundValue);
    return roundValue;
  }

  static hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool compareDateTime(String timeString) {
    var format = DateFormat("HH:mm");
    var compareString = format.parse(timeString);
    var currentTime = format.parse(DateTime.now().hour.toString() +
        ":" +
        DateTime.now().minute.toString());
    final difference = compareString.isAfter(currentTime);
    print('difference $difference');
    if (difference) {
      return true;
    } else {
      return false;
    }
  }

  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    //DateTime date = this.createdTime.toLocal();
    DateTime date = DateTime.parse(dateString);
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours < 60) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays < 6) {
      return '${difference.inDays} days ago';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if ((difference.inDays / 7).ceil() < 4) {
      return '${(difference.inDays / 7).ceil()} weeks ago';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 30).ceil() < 30) {
      return '${(difference.inDays / 30).ceil()} months ago';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    return '${(difference.inDays / 365).floor()} years ago';
  }

  static String addCountryCodeInContactNumber(String number) {
    if (number != null && number.startsWith('+44')) {
      return number;
    } else if (number != null && number.startsWith('0')) {
      var result = number.replaceFirst('0', '+44');
      return result;
    } else if (number != null) {
      return '+44$number';
    } else {
      return '';
    }
  }

  static Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        printWrapped('connected...');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      printWrapped('not connected...');
      return false;
    }
  }

  static String formatTaskDate(DateTime taskDate) {
    final convertLocal = taskDate.toLocal();
    var newFormat = DateFormat("dd/MM/yy");
    String updatedDt = newFormat.format(convertLocal);
    return updatedDt;
  }

  static String convertUTCToLocalTime(String utcDate) {
    var strToDateTime = DateTime.parse(utcDate);
    final convertLocal = strToDateTime.toLocal();
    var newFormat = DateFormat("dd/MM/yyyy");
    String updatedDt = newFormat.format(convertLocal);
    return updatedDt;
  }

  static String CURRENT_VERSION = 'Unknown';

  static double calculateBMI(double weight, double height) {
    return double.parse((weight / math.pow(height, 2)).toStringAsFixed(1));
  }

  static double getWeightByBMIAndHeight(double bmi, double height) {
    return double.parse((bmi * (math.pow(height, 2))).toStringAsFixed(1));
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }

    return age;
  }

  static double? weightingDataComparison(dynamic oldWeight, dynamic newWeight) {
    try {
      var weightComparison = 0.0;

      print('weightComparison weight $oldWeight $newWeight');
      if (oldWeight > newWeight) {
        weightComparison = oldWeight - newWeight;
      } else {
        weightComparison = newWeight - oldWeight;
      }
      print('weightComparison int $weightComparison');
      return weightComparison;
    } catch (e) {
      return null;
    }
  }
}

extension FileExtention on FileSystemEntity {
  String get name {
    return this.path.split("/").last;
  }
}

double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

int compareBetweenTimeOfDays(
    TimeOfDay firstTimeOfDay, TimeOfDay secondTimeOfDay) {
  double firstTime = convertTimeOfDayToDouble(firstTimeOfDay);
  double secondTime = convertTimeOfDayToDouble(secondTimeOfDay);
  return firstTime.compareTo(secondTime);
}

double convertTimeOfDayToDouble(TimeOfDay timeOfDay) {
  return timeOfDay.hour + (timeOfDay.minute / 60.0);
}

String convertTimeOfDayToString(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
}
