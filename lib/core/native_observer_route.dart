import 'package:flutter/material.dart';
import 'package:native_manager_state/core/native_inject.dart';
import 'package:native_manager_state/core/native_manager_controller.dart';

class NativeObserverRoute extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    NativeManagerController.onClose(route.settings.name!);
    NativeInject.remove(route.settings.name!);
    super.didPop(route, previousRoute);
  }
}