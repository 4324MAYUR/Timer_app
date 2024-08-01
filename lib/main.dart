import 'package:flutter/material.dart';
import 'package:timer_app_/screen/homepage.dart';
import 'package:timer_app_/screen/clockpage.dart';
import 'package:timer_app_/screen/stoppage.dart';

void main()
{
  runApp(
    Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Home_Page(),
        "clockpage": (context) => const Clock_Page(),
        "stoppage": (context) => const Stop_Page(),
      },
    );
  }
}
