import 'package:flutter/material.dart';
import 'package:native_state/core/state_notifier.dart';

/// O NativeNotififer foi criado também para padronizar e conter métodos
/// prontos para o desenvolvedor utilizar na reatividade de seus Widgets.
/// Como você pode notar o NativeNotifier contém um StateNotifier, que é um enum
/// que contém possíveis estados para seu Widget, como carregando, erro e que no caso ele está pronto.
/// 
/// setLoading -> Notificar ao seu Widget que no momento ele está em estado de carregando.
/// 
/// setReady -> Notificar ao seu Widget que o estado dele está em pronto, no caso os dados podem ser exibidos.
/// 
/// setError -> Notificar ao seu Widget que o estado dele está com erro, no caso alguma operação falhou.
abstract class NativeNotifier extends ChangeNotifier {
  late StateNotifier _stateNotifier;

  NativeNotifier({StateNotifier stateNotifier = StateNotifier.ready}) {
    _stateNotifier = stateNotifier;
  }

  void setLoading() {
    _stateNotifier = StateNotifier.loading;
    notifyListeners();
  }

  void setReady() {
    _stateNotifier = StateNotifier.ready;
    notifyListeners();
  }

  void setError() {
    _stateNotifier = StateNotifier.error;
    notifyListeners();
  }

  StateNotifier get state => _stateNotifier;
}