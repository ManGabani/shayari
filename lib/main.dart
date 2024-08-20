import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayari_example/View/Screen/Fourth_Screen.dart';
import 'package:shayari_example/View/Screen/home_screen.dart';
import 'package:shayari_example/View/Screen/Second_Screen.dart';

void main() {
  runApp(const ShayariApp());
}

class ShayariApp extends StatelessWidget {
  const ShayariApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
      // home: home_Screen(),
      // home: Fourth_Screen(),
    );
  }
}
