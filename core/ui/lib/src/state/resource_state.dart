
sealed class ResourceState<T>{
  const ResourceState();

  R when<R>({
    required R Function() initialState,
    required R Function() loadingState,
    required R Function(T data) successState,
    required R Function(String message) failureState,
  }){
    return switch(this){
      final ResourceStateInitial<T> _ => initialState(),
      final ResourceStateLoading<T> _ => loadingState(),
      final ResourceStateSuccess<T> succes => successState(succes.data),
      final ResourceStateFailure<T> failure => failureState(failure.message),
    };
  }

  bool get isInitial => this is ResourceStateInitial<T>;
  bool get isLoading => this is ResourceStateLoading<T>;
  bool get isSuccess => this is ResourceStateSuccess<T>;
  bool get isFailure => this is ResourceStateFailure<T>;
}

class ResourceStateInitial<T> extends ResourceState<T> {
  const ResourceStateInitial();
}

class ResourceStateLoading<T> extends ResourceState<T> {
  const ResourceStateLoading();
}

class ResourceStateSuccess<T> extends ResourceState<T> {
  final T data;
  const ResourceStateSuccess(this.data);
}

class ResourceStateFailure<T> extends ResourceState<T> {
  final String message;
  const ResourceStateFailure(this.message);
}


