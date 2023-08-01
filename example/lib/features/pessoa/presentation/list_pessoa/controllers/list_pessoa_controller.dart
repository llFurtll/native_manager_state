import 'package:example/app_routes.dart';
import 'package:example/features/pessoa/domain/entities/pessoa.dart';
import 'package:example/features/pessoa/domain/usecases/get_find_all_pessoa.dart';
import 'package:example/features/pessoa/presentation/list_pessoa/notifiers/list_pessoa_loading_notifier.dart';
import 'package:native_state/core/native_controller.dart';
import 'package:native_state/core/native_navigator.dart';

class ListPessoaController extends NativeController {
  final GetFindAllPessoa getFindAllPessoa;

  ListPessoaController({
    required this.getFindAllPessoa
  });

  final isLoading = ListPessoaLoadingNotifier();
  final List<Pessoa> lista = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    
    Future.value()
      .then((_) => _onLoadPessoas())
      .whenComplete(() => isLoading.setReady());
  }

  void createPeople() async {
    final result = await NativeNavigator.toNamed(AppRoutes.managePessoa);
    if (result != null) {
      _onLoadPessoas();
    }
  }

  void _onLoadPessoas() async {
    lista.clear();
    isLoading.setLoading();
    final (_, result) = await getFindAllPessoa(());
    if (result != null) {
      lista.addAll(result);
    }
    isLoading.setReady();
  }
}