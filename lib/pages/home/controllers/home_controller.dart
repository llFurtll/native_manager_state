import 'package:flutter/material.dart';

import '../../../core/native_controller.dart';
import '../notifiers/count_notifier.dart';

class HomeController extends NativeController {
  final CountNotififer countNotififer;

  HomeController({required this.countNotififer});

  void toDetail(BuildContext context) {
    Navigator.of(context).pushNamed("/detail");
  }
}