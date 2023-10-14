class MyInfo {
  String? character;
  String? script;

  MyInfo({
    this.character,
    this.script,
  });

  // JSON serialization method
  MyInfo.fromJson(Map<String, dynamic> json) {
    character = json['character'];
    script = json['대사'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['character'] = character;
    data['대사'] = script;

    return data;
  }
}
