import 'package:flutter/material.dart';
import 'package:native_state/core/state_notifier.dart';
import 'package:native_state/core/watch_notifier.dart';
import 'package:native_state/core/native_notifier.dart';

/// Widget responsável em observar um NativeNotifier.
/// Aqui é possível trabalhar com os estados do StateNotifier.
/// Toda vez que seu NativeNotifier alterar para o estado de carregando,
/// automaticamente será chamado o método onLoading.
/// Se ele estiver em modo error, então será chamado o onError.
/// E por fim se ele estiver pronto será chamado o onReady.
/// 
/// notifier -> O NativeNotifier a ser observado.
/// onError -> Chamado quando o NativeNotifier notifica como o estado de error.
/// onReady -> Chamado quando o NativeNotifier notifica como o estado de ready.
/// onLoading -> Chamado quando o NativeNotifier notifica como o estado de loading.
class NativeObserver extends StatefulWidget {
  final NativeNotifier notifier;
  final Widget Function(WatchNotifier watchNotifier)? onError;
  final Widget Function(WatchNotifier watchNotifier) onReady;
  final Widget Function(WatchNotifier watchNotifier)? onLoading;

  const NativeObserver({
    super.key,
    required this.notifier,
    required this.onReady,
    this.onError,
    this.onLoading
  });

  @override
  State<StatefulWidget> createState() => NativeObserverState();
}

class NativeObserverState extends State<NativeObserver> {
  late WatchNotifier watchNotifier;
  
  @override
  void initState() {
    super.initState();
    widget.notifier.addListener(() {
      setState(() {});
    });
    watchNotifier = WatchNotifier(
      notifiers: [widget.notifier]
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onError != null && widget.notifier.state == StateNotifier.error) {
      return widget.onError!(watchNotifier);
    } else if (widget.onLoading != null && widget.notifier.state == StateNotifier.loading) {
      return widget.onLoading!(watchNotifier);
    }

    return widget.onReady(watchNotifier);
  }
}