class Talking {
  String? character;
  String? script;

  Talking({
    this.character,
    this.script,
  });

  // JSON serialization method
  Talking.fromJson(Map<String, dynamic> json) {
    character = json['character'];
    script = json['script'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['character'] = character;
    data['script'] = script;

    return data;
  }
}
