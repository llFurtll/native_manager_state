import 'package:example/features/pessoa/domain/entities/pessoa.dart';

abstract class PessoaRepository {
  Future<(Exception?, List<Pessoa>?)> findAll();
  Future<(Exception?, Pessoa?)> insert(Pessoa pessoa);
  Future<(Exception?, Pessoa?)> update(Pessoa pessoa);
  Future<(Exception?, Pessoa?)> find(int id);
}