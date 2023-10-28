class MyInfo {
  String? scenarioName;
  List<String>? genre;
  int? processivity;
  String? lastTalking;
  String? savedTime;

  MyInfo({
    this.scenarioName,
    this.genre,
    this.processivity,
    this.lastTalking,
    this.savedTime,
  });

  // JSON serialization method
  MyInfo.fromJson(Map<String, dynamic> json) {
    scenarioName = json['scenario_name'];
    genre = json['장르'].cast<String>();
    processivity = json['진행도'];
    lastTalking = json['last_talking'];
    savedTime = json['saved_time'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scenario_name'] = scenarioName;
    data['장르'] = genre;
    data['진행도'] = processivity;
    data['last_talking'] = lastTalking;
    data['saved_time'] = savedTime;

    return data;
  }
}
