import 'package:native_manager_state/core/native_controller.dart';

class NativeManagerController {
  static final Map<String, NativeController> _controllers = {};

  static T get<T extends NativeController>() {
    try {
      for (String key in _controllers.keys) {
        if (_controllers[key] is T) {
          return _controllers[key] as T;
        }
      }
      throw Exception();
    } catch (_) {
      throw Exception("Controller not found");
    }
  }

  static bool contains(String scoped) {
    return _controllers.containsKey(scoped);
  }

  static void onClose(String scoped) {
    _controllers[scoped]!.onClose();
  }

  static void add<T extends NativeController>(String scoped, T controller) {
    _controllers[scoped] = controller;
  }
}