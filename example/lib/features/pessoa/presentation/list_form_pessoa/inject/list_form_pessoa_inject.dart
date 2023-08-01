import 'package:example/app_routes.dart';
import 'package:example/features/pessoa/data/datasources/pessoa_local_datasource.dart';
import 'package:example/features/pessoa/data/repositories/pessoa_repository_impl.dart';
import 'package:example/features/pessoa/domain/usecases/get_save_pessoa.dart';
import 'package:example/features/pessoa/presentation/list_form_pessoa/controllers/list_form_pessoa_controller.dart';
import 'package:native_state/core/native_inject.dart';

class ListFormPessoaInject extends NativeInject {
  ListFormPessoaInject() : super(AppRoutes.managePessoa);
  
  @override
  void dependencies() {
    super.register(PessoaLocalDataSourceImpl());
    super.register(PessoaRepositoryImpl(dataSource: super.get()));
    super.register(GetSavePessoa(repository: super.get()));

    super.register(ListFormPessoaController(
      getSavePessoa: super.get()
    ));    
  }
}