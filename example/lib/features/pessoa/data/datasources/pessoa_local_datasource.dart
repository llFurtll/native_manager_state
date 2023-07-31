import 'package:example/features/pessoa/data/models/pessoa_model.dart';

abstract class PessoaLocalDataSource {
  Future<List<PessoaModel>> findAll();
  Future<PessoaModel> insert(PessoaModel pessoa);
  Future<PessoaModel> update(PessoaModel pessoa);
  Future<PessoaModel> find(int id);
}

class PessoaLocalDataSourceImpl extends PessoaLocalDataSource {
  static final List<PessoaModel> _pessoas = List.empty(growable: true);

  @override
  Future<PessoaModel> find(int id) async {
    try {
      return _pessoas.firstWhere((pessoa) => pessoa.idPessoa == id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<PessoaModel>> findAll() async {
    try {
      return _pessoas;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PessoaModel> insert(PessoaModel pessoa) async {
    try {
      _pessoas.add(pessoa);
      return pessoa;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PessoaModel> update(PessoaModel pessoa) async {
    try {
      final index = _pessoas.indexWhere((item) => item.idPessoa == pessoa.idPessoa);
      if (index >= 0) {
        _pessoas[index] = pessoa;
        return pessoa;
      }

      throw Exception();
    } catch (_) {
      rethrow;
    }
  }
}