import 'package:native_state/core/native_controller.dart';
import 'package:native_state/core/native_navigator.dart';

class SecondController extends NativeController {
  @override
  void onInit() {
    print(NativeNavigator.arguments);
  }
}