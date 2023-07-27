import 'package:example/controllers/second_controller.dart';
import 'package:native_state/core/native_inject.dart';

class SecondInject extends NativeInject {
  SecondInject() : super("/second");

  @override
  void dependencies() {
    super.register(SecondController());
  }
}