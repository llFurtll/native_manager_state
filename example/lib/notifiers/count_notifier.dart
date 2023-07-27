import 'package:native_state/core/native_notifier.dart';

class CountNotifier extends NativeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }

  int get count => _count;
}