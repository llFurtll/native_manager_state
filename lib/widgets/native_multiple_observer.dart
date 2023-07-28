import 'package:flutter/material.dart';
import 'package:native_state/core/watch_notifier.dart';
import 'package:native_state/core/native_notifier.dart';


/// Ele tem a mesma ideia do NativeObserver, porém aqui você irá
/// conseguir passar vários NativeNotifier para serem observados.
/// O único ponto que até o momento você irá apenas ter o método build,
/// e não terá acesso a funcionalidade de onLoading, onReady e onError do NativeObserver.
/// 
/// notifiers -> Lista de NativeNotifier a serem escutados.
/// build -> Função que retorna um Widget e é acionado toda vez que um NativeNotifier mudar.
class NativeMultipleObserver extends StatefulWidget {
  final List<NativeNotifier> notifiers;
  final Widget Function(WatchNotifier watchNotifier) build;

  const NativeMultipleObserver({
    super.key,
    required this.notifiers,
    required this.build
  });

  @override
  State<StatefulWidget> createState() => NativeMultipleObserverState();
}

class NativeMultipleObserverState extends State<NativeMultipleObserver> {
  late WatchNotifier watchNotifier;
  
  @override
  void initState() {
    super.initState();
    for (NativeNotifier notifier in widget.notifiers) {
      notifier.addListener(() {
        setState(() {});
      });
    }
    watchNotifier = WatchNotifier(
      notifiers: widget.notifiers
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(watchNotifier);
  }
}