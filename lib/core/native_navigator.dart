import 'package:flutter/material.dart';
import 'package:native_state/widgets/native_app.dart';

/// Utilizado para realizar as navegações entre telas
/// sem necessidade um contexto.
class NativeNavigator {
  const NativeNavigator();

  static Future<Object?> toNamed(
    String route,
    {
      Object? argument
    }
  ) async {
    return await NativeMaterialApp.nativeNavigatorKey.currentState?.pushNamed(route, arguments: argument);
  }

  static void offUntil(
    bool Function(Route<dynamic>) predicate,
   ) async {
    return NativeMaterialApp.nativeNavigatorKey.currentState!.popUntil(predicate);
  }

  static void back({
    Object? arguments
  }) async {
    NativeMaterialApp.nativeNavigatorKey.currentState?.pop(arguments);
  }

  static Object? get arguments => ModalRoute.of(NativeMaterialApp.nativeNavigatorKey.currentState!.overlay!.context)!.settings.arguments!;
}