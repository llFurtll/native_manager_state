import 'package:example/controllers/count_controller.dart';
import 'package:example/notifiers/count_notifier.dart';
import 'package:flutter/material.dart';
import 'package:native_state/widgets/native_observer.dart';
import 'package:native_state/widgets/native_view.dart';

class CountView extends NativeView<CountController> {
  const CountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NativeObserver(
          notifier: controller.countNotifier,
          onReady: (watchNotifier) {
            int count = watchNotifier.watch<CountNotifier>().count;

            return Text("$count");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.toSecond,
        child: const Icon(Icons.add),
      ),
    );
  }

}