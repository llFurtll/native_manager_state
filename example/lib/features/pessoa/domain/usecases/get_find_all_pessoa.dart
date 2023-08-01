import 'package:example/features/pessoa/domain/entities/pessoa.dart';
import 'package:example/features/pessoa/domain/repositories/pessoa_repository.dart';

class GetFindAllPessoa {
  final PessoaRepository repository;

  GetFindAllPessoa({
    required this.repository
  });

  Future<(Exception?, List<Pessoa>?)> call(NoParams params) async {
    return await repository.findAll();
  }
}

typedef NoParams = ();