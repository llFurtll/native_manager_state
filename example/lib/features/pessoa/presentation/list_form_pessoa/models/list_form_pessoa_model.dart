import 'package:example/features/pessoa/domain/entities/pessoa.dart';

class ListFormPessoaModel {
  int? idPessoa;
  String? nome;
  int? idade;

  ListFormPessoaModel({
    this.idPessoa,
    this.nome,
    this.idade
  });

  factory ListFormPessoaModel.fromEntity(Pessoa pessoa) {
    return ListFormPessoaModel(
      idPessoa: pessoa.idPessoa,
      nome: pessoa.nome,
      idade: pessoa.idade
    );
  }

  Pessoa toEntity() {
    return Pessoa(
      idPessoa: idPessoa ?? 0,
      nome: nome,
      idade: idade
    );
  }

  void clear() {
    idPessoa = null;
    nome = null;
    idade = null;
  }
}