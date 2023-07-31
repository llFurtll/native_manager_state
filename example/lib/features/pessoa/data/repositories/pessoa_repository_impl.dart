import 'package:example/features/pessoa/data/datasources/pessoa_local_datasource.dart';
import 'package:example/features/pessoa/data/models/pessoa_model.dart';
import 'package:example/features/pessoa/domain/entities/pessoa.dart';
import 'package:example/features/pessoa/domain/repositories/pessoa_repository.dart';

class PessoaRepositoryImpl extends PessoaRepository {
  final PessoaLocalDataSource dataSource;

  PessoaRepositoryImpl({
    required this.dataSource
  });

  @override
  Future<(Exception?, Pessoa?)> find(int id) async {
    try {
      final result = await dataSource.find(id);
      return (null, result);
    } catch (_) {
      return (Exception(), null);
    }
  }

  @override
  Future<(Exception?, List<Pessoa>?)> findAll() async {
    try {
      final result = await dataSource.findAll();
      return (null, result);
    } catch (_) {
      return (Exception(), null);
    }
  }

  @override
  Future<(Exception?, Pessoa?)> insert(Pessoa pessoa) async {
    try {
      return (null, await dataSource.insert(PessoaModel.fromEntity(pessoa)));
    } catch (_) {
      return (Exception(), null);
    }
  }

  @override
  Future<(Exception?, Pessoa?)> update(Pessoa pessoa) async {
    try {
      return (null, await dataSource.update(PessoaModel.fromEntity(pessoa)));
    } catch (_) {
      return (Exception(), null);
    }
  }
}