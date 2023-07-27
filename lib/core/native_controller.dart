import 'package:flutter/material.dart';

abstract class NativeController {
  NativeController() {
    onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onReady();
    });
  }

  void onInit() {}
  void onReady() {}
  void onClose() {}
}