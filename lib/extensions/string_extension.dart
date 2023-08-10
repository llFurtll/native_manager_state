import 'package:native_state/core/native_notifier.dart';

extension StringExtension on String {
  GenericNativeNotifier<String> get notifier => GenericNativeNotifier(value: this);
}