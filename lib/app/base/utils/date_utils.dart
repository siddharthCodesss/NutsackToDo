import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConstants {
  static const String apiDateFormat = "yyyy-MM-dd HH:mm:ss";
  static const String commonDateFormat = "dd MMMM, yyyy";
  static const String commonTimeFormat = "hh:mm a";
  static const String dateFormat = "dd-MM-yyyy";
}

// Convert date into string format
String dateToString(DateTime date,
    {String dateFormat = DateConstants.dateFormat}) {
  return DateFormat(dateFormat).format(date);
}

// Convert time into string format
String timeToString(TimeOfDay time,
    {String timeFormat = DateConstants.commonTimeFormat}) {
  final format = DateFormat.Hm();
  return DateFormat(timeFormat)
      .format(format.parse("${time.hour}:${time.minute}"));
}

// Convert string into date format
DateTime stringToDate(String dateString,
    {String dateFormat = DateConstants.apiDateFormat}) {
  try {
    return DateFormat(dateFormat).parse(dateString);
  } on Exception catch (_) {
    return DateTime.now();
  }
}

TimeOfDay stringToTime(String timeString) {
  final format = DateFormat.Hms();
  return TimeOfDay.fromDateTime(format.parse(timeString));
}

String getOrdinalDateFormat(DateTime dateTime) {
  var formattedDate = DateFormat("d").format(dateTime.toLocal());
  final digit = int.parse(formattedDate);
  if (digit >= 11 && digit <= 13) {
    return "dd'th' MMMM, yyyy";
  }
  switch (digit % 10) {
    case 1:
      return "dd'st' MMMM, yyyy";
    case 2:
      return "dd'nd' MMMM, yyyy";
    case 3:
      return "dd'rd' MMMM, yyyy";
    default:
      return "dd'th' MMMM, yyyy";
  }
}

// convert date from API response to app date format
String getConvertedDate(String dateString,
    {String dateFormat = DateConstants.commonDateFormat,
      bool isOrdinal = false,
      bool isUtc = true}) {
  try {
    var dateTime =
    DateFormat(DateConstants.apiDateFormat).parse(dateString, isUtc);
    var formattedDate =
    DateFormat(isOrdinal ? getOrdinalDateFormat(dateTime) : dateFormat)
        .format(dateTime.toLocal());
    return formattedDate;
  } on Exception catch (_) {
    return "";
  }
}

// convert date from API response to app time format
String getConvertedTime(String dateString,
    {String dateFormat = DateConstants.commonDateFormat, bool isUTC = true}) {
  try {
    var dateTime =
    DateFormat(DateConstants.apiDateFormat).parse(dateString, isUTC);
    var formattedDate = DateFormat(dateFormat).format(dateTime.toLocal());
    return formattedDate;
  } on Exception catch (_) {
    return "";
  }
}
