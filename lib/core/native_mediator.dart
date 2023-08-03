import 'package:collection/collection.dart';
import 'package:native_state/core/native_controller.dart';

class NativeMediator {
  List<NativeController> controllers = List.empty(growable: true);
  static final NativeMediator _instance = NativeMediator._internal();

  factory NativeMediator() {
    return _instance;
  }

  NativeMediator._internal();

  void register(NativeController controller) {
    controllers.add(controller);
  }

  void unregister(NativeController controller) {
    controllers.remove(controller);
  }

  void send<T extends NativeController>(String message, {dynamic data}) {
    final controller = controllers.whereType<T>().first;
    controller.receive(message, data: data);
  }

  void sendAll(String message, {dynamic data}) {
    for (NativeController controller in controllers) {
      controller.receive(message, data: data);
    }
  }

  void sendMany(List<Type> types, String message, {dynamic data}) {
    for (Type type in types) {
      final controller = controllers.firstWhereOrNull((item) => item.runtimeType == type);
      if (controller != null) {
        controller.receive(message, data: data);
      }
    }
  }
}