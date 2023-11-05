class User {
  String? userId; 
  String? loginId;
  String? password; 
  String? nickname; 

  User({this.userId,this.loginId, this.password, this.nickname});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    loginId = json['loginId'];
    password = json['password'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['loginId'] = loginId;
    data['password'] = password;
    data['nickname'] = nickname;
    return data;
  }
}
