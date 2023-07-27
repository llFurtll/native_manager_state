import 'package:flutter/material.dart';
import 'package:native_manager_state/core/watch_notifier.dart';
import 'package:native_manager_state/core/native_notifier.dart';


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