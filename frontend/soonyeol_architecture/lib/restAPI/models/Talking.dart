class Talking {
  String? character;
  String? script;
  String? isMe;

  Talking({
    this.character,
    this.script,
    this.isMe,
  });

  void changeScript(String text) {
    script = text;
  }

  // JSON serialization method
  Talking.fromJson(Map<String, dynamic> json) {
    character = json['name'];
    script = json['script'];
    isMe = json['isMe'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = character;
    data['script'] = script;
    data['isMe'] = isMe;
    return data;
  }
}
