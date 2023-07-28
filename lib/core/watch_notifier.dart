import 'package:native_state/core/native_notifier.dart';

/// A ideia do WatchNotifier é você conseguir recuperar as instâncias
/// de seus NativeNotifier passado para o NativeMultipleObserver ou o NativeObserver.
/// Nisso caso a instância do seu NatveNotifier esteja em sua Controller, você não irá
/// ter necessidade de acessálo utilizando: controller.notifier.valor.
/// Dentro do seu Widget você irá conseguir realizar a operação utilizando: watchNotifier.watch<Notifier>().valor;
/// 
/// watch -> Busca o NativeNotifier pelo tipo.
class WatchNotifier {
  final List<NativeNotifier> notifiers;

  const WatchNotifier({required this.notifiers});

  T watch<T extends NativeNotifier>() {
    return notifiers.whereType<T>().first;
  }
}
