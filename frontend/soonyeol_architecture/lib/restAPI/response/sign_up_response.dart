class SignUpResponse {
  String? message;
  String? statusCode;

  SignUpResponse({this.message, this.statusCode});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
  }
}