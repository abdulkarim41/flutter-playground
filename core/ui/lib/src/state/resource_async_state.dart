

sealed class ResourceAsyncState<T>{
  const ResourceAsyncState();

  const factory ResourceAsyncState.loading() = ResourceStateAsyncLoading<T>._;
  const factory ResourceAsyncState.failure(String message) = ResourceAsyncStateFailure<T>._;
  const factory ResourceAsyncState.success(T data) = ResourceAsyncStateSuccess<T>._;

  R when<R>({
    required R Function() loadingState,
    required R Function(T data) successState,
    required R Function(String message) failureState,
  }){
    return switch(this){
      final ResourceStateAsyncLoading<T> _ => loadingState(),
      final ResourceAsyncStateSuccess<T> succes => successState(succes.data),
      final ResourceAsyncStateFailure<T> failure => failureState(failure.message),
    };
  }

  bool get isLoading => this is ResourceStateAsyncLoading<T>;
  bool get isSuccess => this is ResourceAsyncStateSuccess<T>;
  bool get isFailure => this is ResourceAsyncStateFailure<T>;

  T? get dataOrNull => isSuccess ? (this as ResourceAsyncStateSuccess<T>).data : null;
}

class ResourceStateAsyncLoading<T> extends ResourceAsyncState<T> {
  const ResourceStateAsyncLoading._();
}

class ResourceAsyncStateSuccess<T> extends ResourceAsyncState<T> {
  final T data;
  const ResourceAsyncStateSuccess._(this.data);
}

class ResourceAsyncStateFailure<T> extends ResourceAsyncState<T> {
  final String message;
  const ResourceAsyncStateFailure._(this.message);
}

