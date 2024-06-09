class ApiResponse<T> {
  final int statusCode;
  final bool status;
  final String? message;
  final T? data;

  ApiResponse({
    required this.status,
    this.statusCode = 0,
    this.message,
    this.data,
  });
}
