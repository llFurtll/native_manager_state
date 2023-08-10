import 'package:native_state/core/native_notifier.dart';

extension DoubleExtension on double {
  GenericNativeNotifier<double> get notifier => GenericNativeNotifier(value: this);
}