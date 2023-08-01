import 'package:native_state/core/native_controller.dart';

/// A NativeManagerController serve para gerenciar as Controllers utilizadas na aplicação.
/// Nesse caso usamos ela tanto para buscar na NativeView a Controller correspondente,
/// como também utilizamos para chamar o onClose da Controller quando o pop do Navigator é acionado.
/// Nesse caso essa classe é apenas para uso interno do plugin.
/// 
/// get -> Busca a Controller que a NativeView precisa.
/// 
/// contains -> Apenas valida se no map de Controllers existe ou não a Controller já adicionada.
/// 
/// onClose -> Chama o onClose da Controller no momento do pop do Navigator.
/// 
/// add -> Adiciona a Controller no map de Controllers.
class NativeManagerController {
  static final Map<String, NativeController> _controllers = {};

  static T get<T extends NativeController>() {
    try {
      for (String key in _controllers.keys) {
        if (_controllers[key] is T) {
          return _controllers[key] as T;
        }
      }
      throw Exception();
    } catch (_) {
      throw Exception("Controller not found");
    }
  }

  static bool contains(String scoped) {
    return _controllers.containsKey(scoped);
  }

  static void onClose(String scoped) {
    _controllers[scoped]!.onClose();
    _controllers.remove(scoped);
  }

  static void add<T extends NativeController>(String scoped, T controller) {
    _controllers[scoped] = controller;
  }
}