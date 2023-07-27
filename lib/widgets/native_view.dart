import 'package:flutter/material.dart';
import 'package:native_manager_state/core/native_controller.dart';
import 'package:native_manager_state/core/native_manager_controller.dart';

abstract class NativeView<T extends NativeController> extends StatelessWidget {
  const NativeView({super.key});

  T get controller => NativeManagerController.get<T>();

  @override
  Widget build(BuildContext context);
}