
sealed class ResourceResultState<T>{
  const ResourceResultState();

  R when<R>({
    required R Function(T data) successState,
    required R Function(String message) failureState,
  }){
    return switch(this){
      final ResourceResultStateSuccess<T> succes => successState(succes.data),
      final ResourceResultStateFailure<T> failure => failureState(failure.message),
    };
  }

  bool get isSuccess => this is ResourceResultStateSuccess<T>;
  bool get isFailure => this is ResourceResultStateFailure<T>;
}

class ResourceResultStateSuccess<T> extends ResourceResultState<T> {
  final T data;
  const ResourceResultStateSuccess(this.data);
}

class ResourceResultStateFailure<T> extends ResourceResultState<T> {
  final String message;
  const ResourceResultStateFailure(this.message);
}

