import 'package:flutter/material.dart';
import 'package:to_do_app/utilidades/colors.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Firstcolor,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
