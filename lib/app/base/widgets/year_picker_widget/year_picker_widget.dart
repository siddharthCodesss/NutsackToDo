import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime? _selectedDate;

Widget buildYearPicker() {
  return YearPicker(
      firstDate: DateTime(DateTime.now().year), 
      lastDate: DateTime(2050),
      selectedDate: _selectedDate!,
      onChanged: (DateTime dateTime) async {
        _selectedDate = dateTime;
        print(_selectedDate);
      }
  );
}