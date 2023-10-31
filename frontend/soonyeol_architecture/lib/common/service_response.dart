class ApiResponse<T> {
  ApiResponse({required this.result, this.value, this.errorMsg = '',this.statusCode});

  String errorMsg;
  bool result;
  T? value;
  int? statusCode;
}
