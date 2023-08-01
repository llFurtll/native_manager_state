import 'package:flutter/material.dart';
import 'package:native_state/widgets/native_app.dart';

/// Utilizado para realizar as navegações entre telas
/// sem necessidade um contexto.
class NativeNavigator {
  NativeNavigator();

  static Object? _arguments;

  static Future<Object?> toNamed(
    String route,
    {
      Object? argument
    }
  ) async {
    _arguments = argument;
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
    _arguments = arguments;
    NativeMaterialApp.nativeNavigatorKey.currentState?.pop(arguments);
  }

  static Object? get arguments => _arguments;
  static set setArguments(Object? arguments) => _arguments = arguments;
}