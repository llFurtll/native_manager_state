import 'package:example/features/pessoa/domain/entities/pessoa.dart';
import 'package:example/features/pessoa/domain/usecases/get_save_pessoa.dart';
import 'package:example/features/pessoa/presentation/list_form_pessoa/models/list_form_pessoa_model.dart';
import 'package:flutter/material.dart';
import 'package:native_state/core/native_controller.dart';
import 'package:native_state/core/native_navigator.dart';
import 'package:native_state/core/native_utils.dart';

class ListFormPessoaController extends NativeController {
  final GetSavePessoa getSavePessoa;

  ListFormPessoaController({
    required this.getSavePessoa
  });

  final keyForm = GlobalKey<FormState>();

  ListFormPessoaModel pessoaModel = ListFormPessoaModel();

  @override
  void onInit() {
    super.onInit();
    final pessoa = NativeNavigator.arguments as Pessoa?;
    if (pessoa != null) {
      pessoaModel = ListFormPessoaModel.fromEntity(pessoa);
    }
  }

  void save() async {
    if (keyForm.currentState?.validate() ?? false) {
      keyForm.currentState?.save();
      final pessoa = pessoaModel.toEntity();
      final (_, result) = await getSavePessoa((pessoa: pessoa));
      if (result != null) {
        NativeNavigator.back(arguments: pessoa);
      } else {
        NativeUtils.dialog(builder: (_) {
          return AlertDialog(
            title: const Text("Atenção"),
            content: Text("Não foi possível cadastrar a pessoa ${pessoa.nome}, tente novamente!"),
          );
        });
      }
    } else {
      NativeUtils.dialog(builder: (_) {
        return const AlertDialog(
          title: Text("Atenção"),
          content: Text("Preencha os campos obrigatórios"),
        );
      });
    }
  }
}