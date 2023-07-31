import 'package:example/features/pessoa/domain/entities/pessoa.dart';

class PessoaModel extends Pessoa {
  PessoaModel({required super.idPessoa, required super.nome, required super.idade});

  factory PessoaModel.fromEntity(Pessoa pessoa) {
    return PessoaModel(
      idPessoa: pessoa.idPessoa,
      nome: pessoa.nome,
      idade: pessoa.idade
    );
  }
}