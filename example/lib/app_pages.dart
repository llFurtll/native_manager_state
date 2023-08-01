import 'package:example/app_routes.dart';
import 'package:example/features/pessoa/presentation/list_form_pessoa/inject/list_form_pessoa_inject.dart';
import 'package:example/features/pessoa/presentation/list_form_pessoa/view/list_form_pessoa_view.dart';
import 'package:example/features/pessoa/presentation/list_pessoa/inject/list_pessoa_inject.dart';
import 'package:example/features/pessoa/presentation/list_pessoa/view/list_pessoa_view.dart';
import 'package:native_state/core/native_router.dart';

class AppPages {
  static List<NativeRouter> pages = [
    NativeRouter(
      name: AppRoutes.listaPessoa,
      build: () => const ListPessoaView(),
      inject: ListPessoaInject()
    ),
    NativeRouter(
      name: AppRoutes.managePessoa,
      build: () => const ListFormPessoaView(),
      inject: ListFormPessoaInject()
    )
  ];
}