class User {
  String? userId; 
  String? password; 
  String? nickname; 

  User({this.userId, this.password, this.nickname});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    password = json['password'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['password'] = password;
    data['nickname'] = nickname;
    return data;
  }
}
