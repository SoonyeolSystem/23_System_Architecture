class LoginResponse {
  String? message;
  String? statusCode;
  String? userId;
  String? nickname;

  LoginResponse({this.message, this.statusCode, this.userId='', this.nickname=''});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    userId=json['userId'];
    nickname=json['nickname'];
  }
}