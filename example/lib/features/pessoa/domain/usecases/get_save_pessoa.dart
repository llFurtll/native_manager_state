import 'package:example/features/pessoa/domain/entities/pessoa.dart';
import 'package:example/features/pessoa/domain/repositories/pessoa_repository.dart';
import 'package:flutter/material.dart';

class GetSavePessoa {
  final PessoaRepository repository;

  GetSavePessoa({
    required this.repository
  });

  Future<(Exception?, Pessoa?)> call(SavePessoaParams params) async {
    if (params.pessoa.idPessoa == 0) {
      params.pessoa.idPessoa = UniqueKey().hashCode;
      return await repository.insert(params.pessoa);
    }

    return await repository.update(params.pessoa);
  }
}

typedef SavePessoaParams = ({Pessoa pessoa});