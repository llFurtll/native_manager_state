import 'package:example/features/pessoa/domain/entities/pessoa.dart';
import 'package:example/features/pessoa/presentation/list_pessoa/controllers/list_pessoa_controller.dart';
import 'package:flutter/material.dart';
import 'package:native_state/widgets/native_view.dart';
import 'package:native_state/widgets/native_observer.dart';

class ListPessoaView extends NativeView<ListPessoaController> {
  const ListPessoaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFab(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Lista de pessoas"),
    );
  }

  Widget _buildBody() {
    return NativeObserver(
      notifier: controller.isLoading,
      onReady: (_) {
        final lista = controller.lista;

        if (lista.isEmpty) {
          return const Center(child: Text("Nenhuma pessoa cadastrada!"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: lista.length,
          itemBuilder: (_, index) => _buildCard(lista[index])
        );
      },
      onLoading: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: controller.createPeople,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildCard(Pessoa pessoa) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: ${pessoa.nome}"),
            Text("Idade: ${pessoa.idade}"),
          ],
        ),
      ),
    );
  }
}