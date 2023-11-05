class MyInfo {
  String? situationName;
  List<String>? genre;
  int? processivity;
  String? lastTalking;
  DateTime? savedTime;

  MyInfo({
    this.situationName,
    this.genre,
    this.processivity,
    this.lastTalking,
    this.savedTime,
  });

  // JSON serialization method
  MyInfo.fromJson(Map<String, dynamic> json) {
    situationName = json['situation_name'];
    genre = json['genre'].cast<String>();
    processivity = json['progress'];
    lastTalking = json['last_talking'];
    savedTime = json['saved_time'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['situation_name'] = situationName;
    data['genre'] = genre;
    data['progress'] = processivity;
    data['last_talking'] = lastTalking;
    data['saved_time'] = savedTime;

    return data;
  }
}
