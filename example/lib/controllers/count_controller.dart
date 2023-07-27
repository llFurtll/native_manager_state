import 'package:example/notifiers/count_notifier.dart';
import 'package:flutter/material.dart';
import 'package:native_state/core/native_controller.dart';

class CountController extends NativeController {
  final countNotifier = CountNotifier();

  void increment() {
    countNotifier.increment();
  }

  void toSecond(BuildContext context) {
    Navigator.of(context).pushNamed("/second");
  }
}