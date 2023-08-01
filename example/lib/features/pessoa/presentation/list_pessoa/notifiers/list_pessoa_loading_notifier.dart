import 'package:native_state/core/native_notifier.dart';
import 'package:native_state/core/state_notifier.dart';

class ListPessoaLoadingNotifier extends NativeNotifier {
  ListPessoaLoadingNotifier() : super(stateNotifier: StateNotifier.loading);
}