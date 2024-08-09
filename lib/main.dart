import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/pages/splash_screen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'SplashScreen',
      routes: {
        'SplashScreen': (context) => const SplashScreen(),
        'HomePage': (context) => const HomePage(),
      },
    );
  }
}
