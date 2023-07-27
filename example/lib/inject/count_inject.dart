import 'package:example/controllers/count_controller.dart';
import 'package:native_state/core/native_inject.dart';

class CountInject extends NativeInject {
  CountInject() : super("/");

  @override
  void dependencies() {
    super.register(CountController());
  }
}