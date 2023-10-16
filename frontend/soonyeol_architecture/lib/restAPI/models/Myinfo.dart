class MyInfo {
  String? scenarioName;
  List<String>? genre;
  int? processivity;

  MyInfo({
    this.scenarioName,
    this.genre,
    this.processivity,
  });

  // JSON serialization method
  MyInfo.fromJson(Map<String, dynamic> json) {
    scenarioName = json['scenario_name'];
    genre = json['장르'].cast<String>();
    processivity = json['진행도'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scenario_name'] = scenarioName;
    data['장르'] = genre;
    data['진행도'] = processivity;

    return data;
  }
}
