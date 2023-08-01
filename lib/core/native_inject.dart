import 'dart:developer';

import 'package:native_state/core/native_controller.dart';
import 'package:native_state/core/native_manager_controller.dart';

/// A NativeInject é a responsável em injetar as dependências de seus Widgets.
/// Um ponto importante aqui é entender que essas dependências serão injetadas
/// por escopo.
/// 
/// Por exemplo, cada rota que você criar no sistema, exemplo "/" e "/detail",
/// você no caso terá duas NativeInject, pois cada rota do sistema precisa ter um NativeInject
/// para funcionar, nisso cada rota do sistema será injetado suas dependências, então, a rota "/"
/// não terá acesso as dependências da rota "/detail".
/// 
/// Esse escopo é passado no momento da extensão da classe NativeInject onde você passa
/// qual o escopo ela irá trabalhar.
/// 
/// register -> Esse método é utilizado para registrar as dependências que você deseja utilizar
/// em sua rota, nesse caso você irá utilizar esse método usando o super.register(<dependência>).
/// 
/// get -> Esse método busca a dependência por meio do tipo, exemplo super.get<TipoDependencia>();
/// 
/// remove -> Esse método é utilizado pelo próprio plugin, não se preocupe você não irá utilizá-lo, ele
/// é chamado no momento em que uma rota é removida da memória.
/// 
/// dependencies -> Nesse método é onde você irá configurar suas dependências, aqui você irá chamar o register
/// pelo super e registrando elas no escopo configurado.
abstract class NativeInject {
  static final Map<String, List<dynamic>> _dependencies = {};
  final String scoped;

  NativeInject(this.scoped);

  void register(dynamic object) {
    if (object is NativeController && !NativeManagerController.contains(scoped)) {
      NativeManagerController.add(scoped, object);
    }

    if (_dependencies.containsKey(scoped)) {
      _dependencies[scoped]!.add(object);
    } else {
      _dependencies[scoped] = [object];
    }

    log("Create instance: ${object.runtimeType}");
  }

  T get<T>() {
    return _dependencies[scoped]!.whereType<T>().first;
  }

  static remove(String innerScopped) {
    final list = _dependencies[innerScopped]!;
    _dependencies.remove(innerScopped);
    for (dynamic object in list) {
      log("Remove instance: ${object.runtimeType}");
    }
    list.clear();
  }

  void dependencies();
}