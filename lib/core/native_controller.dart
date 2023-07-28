import 'package:flutter/material.dart';

/// A NativeController foi criada para definir um padrão
/// para as Controllers da aplicação, nisso o desenvolvedor
/// ter possibilidades de executar instruções durante a criação
/// de seus Widgets.
/// 
/// onInit -> Disparado no momento da criação da Controller.
/// Esse método é interessante usar para disparar tasks ou até mesmo
/// declarar variáveis, nesse caso ele será chamado apenas uma vez.
///
/// onReady -> Disparado após o build do Widget.
/// Esse método é interessante usar para exibir por exemplo uma mensagem de boas vindas
/// ao usuário.
/// 
/// onClose -> Disparado no momento que o Widget será removido da memória, nesse caso
/// esse métood será disparado quando o evento de pop do Navigator for acionado.
/// É interessante usar para cancelar/dipose tasks ou controladores que estejam executando
/// processos e devem ser parados no momento que o Widget não está sendo mais utilizado.
abstract class NativeController {
  NativeController() {
    onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onReady();
    });
  }

  void onInit() {}
  void onReady() {}
  void onClose() {}
}