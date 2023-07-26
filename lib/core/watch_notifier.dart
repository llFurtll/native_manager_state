import 'package:native_manager_state/notifiers/native_notifier.dart';

class WatchNotifier {
  final List<NativeNotifier> notifiers;

  const WatchNotifier({required this.notifiers});

  T watch<T extends NativeNotifier>() {
    return notifiers.firstWhere((notifier) => notifier.runtimeType == T) as T;
  }
}
