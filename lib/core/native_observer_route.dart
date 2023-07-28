import 'package:flutter/material.dart';
import 'package:native_state/core/native_inject.dart';
import 'package:native_state/core/native_manager_controller.dart';

/// O NativeObserverRoute é utilizado para observar as alterações
///  de rota do sistema, é nesse momento que removemos as dependências
/// da rota quando a mesma for removida da memória e também chamamos o método
/// onClose da Controller da rota correspondente.
class NativeObserverRoute extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    NativeManagerController.onClose(route.settings.name!);
    NativeInject.remove(route.settings.name!);
    super.didPop(route, previousRoute);
  }
}