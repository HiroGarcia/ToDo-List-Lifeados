import 'package:flutter/material.dart';

class ToDo {
  bool isMake = false;
  String toDoName;
  TimeOfDay selectedTime;

  ToDo({
    required this.toDoName,
    required this.selectedTime,
  });
}
