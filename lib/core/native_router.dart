import 'package:flutter/material.dart';
import 'package:native_state/core/native_inject.dart';

/// Classe base para criar as rotas do sistema.
/// 
/// name -> Nome da sua rota.
/// 
/// build -> Função que retorna a NativeView.
/// 
/// inject -> A NativeInject com as dependências da rota.
class NativeRouter {
  final String name;
  final Widget Function() build;
  final NativeInject inject;

  const NativeRouter({
    required this.name,
    required this.build,
    required this.inject
  });
}