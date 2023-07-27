import 'package:flutter/material.dart';
import 'package:native_state/core/state_notifier.dart';

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