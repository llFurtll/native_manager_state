import 'package:native_state/core/native_notifier.dart';

extension ListExtension<T> on List<T> {
  GenericNativeNotifier<List<T>> get notifier => GenericNativeNotifier(value: this);
}