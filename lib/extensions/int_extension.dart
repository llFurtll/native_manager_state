import '../core/native_notifier.dart';

extension IntExtension on int {
  GenericNativeNotifier<int> get notifier => GenericNativeNotifier(value: this);
}