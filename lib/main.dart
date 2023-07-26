import 'package:flutter/material.dart';
import 'package:native_manager_state/core/native_router.dart';
import 'package:native_manager_state/notifiers/native_notifier.dart';
import 'package:native_manager_state/widgets/native_app.dart';
import 'package:native_manager_state/widgets/native_observer.dart';
import 'package:native_manager_state/widgets/native_view.dart';

void main() {
  runApp(
    NativeMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      nativeRoutes: [
        NativeRouter(
          name: "/",
          build: () => const HomeView(),
          inject: (injector) {
            injector.registerSingleton(HomeController());
          }
        )
      ]
    )
  );
}

class CountNotififer extends NativeNotifier {
  int _count = 0;

  void increment() async {
    _count++;
    notifyListeners();
  }

  int get count => _count;
}

class HomeController {
  final countNotifier = CountNotififer();
}

class HomeView extends NativeView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NativeObserver(
          notifier: controller.countNotifier,
          onReady: (watchNotifier) {
            final count = watchNotifier.watch<CountNotififer>().count;

            return Text("$count");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.countNotifier.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}