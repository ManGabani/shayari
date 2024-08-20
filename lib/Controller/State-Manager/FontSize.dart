import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../View/Screen/Fourth_Screen.dart';

class Controler extends GetxController{
  Rx<double> fontSize=24.0.obs;
  // Rx<Color> backgroundcolor=const Color(0xFFFFFFFF).obs;
  Rx<Color> backgroundcolor=Color.fromARGB(255, 167, 176, 183).obs;
  Rx<Color> TextColor=Color.fromARGB(255, 21, 20, 20).obs;

  Rx<String> emojies=''.obs;

  Rx<String> fontFamily = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emojies.value= emoji[Random().nextInt(emoji.length)];
  }


}