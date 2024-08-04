import 'package:flutter/material.dart';

class ToDo {
  bool isMake;
  String toDoName;
  TimeOfDay selectedTime;

  ToDo({
    this.isMake = false,
    required this.toDoName,
    required this.selectedTime,
  });
}
