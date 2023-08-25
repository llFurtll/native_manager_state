import 'package:native_state/core/native_notifier.dart';

extension BooleanExtension on bool {
  GenericNativeNotifier<bool> get notifier => GenericNativeNotifier(value: this);
}