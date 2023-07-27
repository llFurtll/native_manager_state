import 'package:flutter/material.dart';

import '../../../widgets/native_observer.dart';
import '../../../widgets/native_view.dart';
import '../controllers/home_controller.dart';
import '../notifiers/count_notifier.dart';

class HomeView extends NativeView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NativeObserver(
          notifier: controller.countNotififer,
          onReady: (watchNotifier) {
            final count = watchNotifier.watch<CountNotififer>().count;

            return Text("$count");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.toDetail(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}