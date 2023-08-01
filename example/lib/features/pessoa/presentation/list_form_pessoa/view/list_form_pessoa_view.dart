import 'package:example/features/pessoa/presentation/list_form_pessoa/controllers/list_form_pessoa_controller.dart';
import 'package:flutter/material.dart';
import 'package:native_state/core/native_navigator.dart';
import 'package:native_state/widgets/native_view.dart';

class ListFormPessoaView extends NativeView<ListFormPessoaController> {
  const ListFormPessoaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: _buildForm(),
      ),
      floatingActionButton: _buildFab(),
    );
  }

  AppBar _buildAppBar() {
    final pessoa = controller.pessoaModel;

    return AppBar(
      title: Text(pessoa.nome != null ? "Editar ${pessoa.nome}" : "Cadastrar pessoa"),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => NativeNavigator.back(),
        icon: const Icon(Icons.arrow_back),
      ),
    ); 
  }

  Widget _buildForm() {
    return Form(
      key: controller.keyForm,
      child: Column(
        children: [
          _buildInput(
            name: "Nome",
            type: TextInputType.name,
            initialValue: controller.pessoaModel.nome,
            onSave: (value) => controller.pessoaModel.nome = value
          ),
          const SizedBox(height: 10.0),
          _buildInput(
            name: "Idade",
            type: TextInputType.number,
            initialValue: "${controller.pessoaModel.idade ?? ""}",
            onSave: (value) => controller.pessoaModel.idade = int.tryParse(value ?? "")
          )
        ],
      )
    );
  }

  Widget _buildInput({
    required String name,
    required TextInputType type,
    required String? initialValue,
    required Function(String? value) onSave
  }) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(name),
        border: const OutlineInputBorder()
      ),
      keyboardType: type,
      initialValue: initialValue,
      validator: (value) {
        if (value == null || value.isEmpty) return "Campo obrigatório";

        return null; 
      },
      onSaved: onSave,
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: controller.save,
      child: const Icon(Icons.save_alt),
    );
  }
}