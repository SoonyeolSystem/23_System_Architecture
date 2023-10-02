class Talking {
  String? line;

  Talking({
    this.line,
  });

  // JSON serialization method
  Talking.fromJson(Map<String, dynamic> json) {
    line = json['대사'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['대사'] = line;

    return data;
  }
}
