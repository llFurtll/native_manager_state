abstract class IUseCase<R, P> {
  Future<(Failure?, R?)> call(P params);
}

abstract class Failure {
  final String message;

  const Failure({
    required this.message
  });
}

class ExampleFailure extends Failure {
  const ExampleFailure({
    required super.message
  });
}

class NativeRecords<C extends IUseCase, P> {
  final C instance;
  final P params;
  
  const NativeRecords({
    required this.instance,
    required this.params
  });
  
  void fold<R>(Function(Failure failure) failure, Function(R result) result) async {
    final (fail, ok) = await instance(params);
    if (fail != null) {
      failure(fail);
      return;
    }
    
    if (ok != null) {
      result(ok);
    }
  }
}

class NoParams {}

class GetVersion extends IUseCase<String?, NoParams> {
  @override
  Future<(Failure?, String?)> call(NoParams params) async {
    return (null, "V1.5");
  }
}