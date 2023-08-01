import 'package:example/app_routes.dart';
import 'package:example/features/pessoa/data/datasources/pessoa_local_datasource.dart';
import 'package:example/features/pessoa/data/repositories/pessoa_repository_impl.dart';
import 'package:example/features/pessoa/domain/usecases/get_find_all_pessoa.dart';
import 'package:example/features/pessoa/presentation/list_pessoa/controllers/list_pessoa_controller.dart';
import 'package:native_state/core/native_inject.dart';

class ListPessoaInject extends NativeInject {
  ListPessoaInject() : super(AppRoutes.listaPessoa);

  @override
  void dependencies() {
    super.register(PessoaLocalDataSourceImpl());
    super.register(PessoaRepositoryImpl(dataSource: super.get()));
    super.register(GetFindAllPessoa(repository: super.get()));

    super.register(ListPessoaController(
      getFindAllPessoa: super.get()
    ));
  }
}