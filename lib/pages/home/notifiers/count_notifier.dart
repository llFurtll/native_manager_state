import '../../../core/native_notifier.dart';

class CountNotififer extends NativeNotifier {
  int _count = 0;

  void increment() async {
    _count++;
    notifyListeners();
  }

  int get count => _count;
}