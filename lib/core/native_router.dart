import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NativeRouter {
  final String name;
  final Widget Function() build;
  final Function(GetIt injector) inject;

  const NativeRouter({
    required this.name,
    required this.build,
    required this.inject
  });
}