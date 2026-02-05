class BaseResponse<T> {
  final int statusCode;
  final Object? error;
  final T? data;
  const BaseResponse({required this.statusCode, this.data, this.error});
}
