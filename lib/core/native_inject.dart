import 'dart:developer';

import 'package:native_manager_state/core/native_controller.dart';
import 'package:native_manager_state/core/native_manager_controller.dart';

abstract class NativeInject {
  static final Map<String, List<dynamic>> _dependencies = {};
  final String scoped;

  NativeInject(this.scoped);

  void register(dynamic object) {
    if (object is NativeController && !NativeManagerController.contains(scoped)) {
      NativeManagerController.add(scoped, object);
    }

    if (_dependencies.containsKey(scoped)) {
      _dependencies[scoped]!.add(object);
    } else {
      _dependencies[scoped] = [object];
    }

    log("Create instance: ${object.runtimeType}");
  }

  T get<T>() {
    return _dependencies[scoped]!.whereType<T>().first;
  }

  static remove(String innerScopped) {
    final list = _dependencies[innerScopped]!;
    _dependencies.remove(innerScopped);
    for (dynamic object in list) {
      log("Remove instance: ${object.runtimeType}");
    }
  }

  void dependencies();
}