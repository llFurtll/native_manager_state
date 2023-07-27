import 'package:flutter/material.dart';
import 'package:native_manager_state/core/native_inject.dart';

class NativeRouter {
  final String name;
  final Widget Function() build;
  final NativeInject inject;

  const NativeRouter({
    required this.name,
    required this.build,
    required this.inject
  });
}