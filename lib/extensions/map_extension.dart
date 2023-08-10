import '../core/native_notifier.dart';

extension MapExtension<K, V> on Map<K, V> {
  GenericNativeNotifier<Map<K, V>> get notifier => GenericNativeNotifier(value: this);
}