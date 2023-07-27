import 'package:native_manager_state/core/native_inject.dart';
import 'package:native_manager_state/pages/details/controllers/detail_controller.dart';

class DetailInject extends NativeInject {
  DetailInject() : super("/detail");

  @override
  void dependencies() {
    super.register(DetailController());
  }
}