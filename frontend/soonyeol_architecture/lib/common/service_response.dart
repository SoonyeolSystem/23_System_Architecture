class ApiResponse<T> {
  ApiResponse({
    required this.result,
    this.value,
    this.errorMsg = '',
    this.statusCode,
    this.userId,
    this.nickname,
  });

  String errorMsg;
  bool result;
  T? value;
  int? statusCode;
  String? userId;
  String? nickname;
}
