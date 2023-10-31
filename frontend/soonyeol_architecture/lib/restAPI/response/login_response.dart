class LoginResponse {
  String? message;
  String? statusCode;

  LoginResponse({this.message, this.statusCode});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
  }
}