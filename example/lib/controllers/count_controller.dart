import 'package:example/notifiers/count_notifier.dart';
import 'package:native_state/core/native_controller.dart';
import 'package:native_state/core/native_navigator.dart';

class CountController extends NativeController {
  final countNotifier = CountNotifier();

  void increment() {
    countNotifier.increment();
  }

  void toSecond() async {
    final result = await NativeNavigator.toNamed("/second", argument: "LEGAL");
    print(result);
  }
}