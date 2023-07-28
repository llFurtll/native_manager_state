import 'package:flutter/material.dart';
import 'package:native_state/core/native_controller.dart';
import 'package:native_state/core/native_manager_controller.dart';

/// Classe que define o padrão de uma View de uma rota, nesse caso
/// aqui você terá acesso a sua Controller.
/// Um ponto interessante que toda sua View no sistema será um StatelesWidget.
/// Como podem observar a Controller é chamada utilizando o NativeManagerController.
/// 
/// build -> Widget a ser renderizado quando o NativeVew é chamado.
abstract class NativeView<T extends NativeController> extends StatelessWidget {
  const NativeView({super.key});

  T get controller => NativeManagerController.get<T>();

  @override
  Widget build(BuildContext context);
}