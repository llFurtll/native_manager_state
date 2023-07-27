import 'package:native_manager_state/pages/home/notifiers/count_notifier.dart';

import '../../../core/native_inject.dart';
import '../controllers/home_controller.dart';

class HomeNativeInject extends NativeInject {
  HomeNativeInject() : super("/");

  @override
  void dependencies() {
    super.register(CountNotififer());
    super.register(HomeController(
      countNotififer: super.get(),
    ));
  }
}