import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class NativeView<T extends Object> extends StatelessWidget {
  const NativeView({super.key});

  T get controller => GetIt.I.get<T>();

  @override
  Widget build(BuildContext context);
}