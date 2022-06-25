enum QueryStatus {
  loading,
  success,
  error,
}

class QueryState<TData, TError> {
  TData? data;
  TError? error;
  DateTime? dataUpdatedAt;
  DateTime? errorUpdatedAt;
  bool isFetching;

  QueryStatus get status => dataUpdatedAt == null
      ? QueryStatus.loading
      : error != null
          ? QueryStatus.error
          : QueryStatus.success;

  bool get isLoading => status == QueryStatus.loading;
  bool get isSuccess => status == QueryStatus.success;
  bool get isError => status == QueryStatus.error;

  QueryState({
    this.data,
    this.error,
    this.dataUpdatedAt,
    this.errorUpdatedAt,
    this.isFetching = false,
  });

  QueryState<TData, TError> copyWith({
    dynamic data,
    dynamic error,
    DateTime? dataUpdatedAt,
    DateTime? errorUpdatedAt,
    bool? isFetching,
  }) {
    return QueryState(
      data: data ?? this.data,
      error: error ?? this.error,
      dataUpdatedAt: dataUpdatedAt ?? this.dataUpdatedAt,
      errorUpdatedAt: errorUpdatedAt ?? this.errorUpdatedAt,
      isFetching: isFetching ?? this.isFetching,
    );
  }
}
