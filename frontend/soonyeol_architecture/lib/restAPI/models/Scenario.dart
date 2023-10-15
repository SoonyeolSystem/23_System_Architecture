class Scenario {
  String? scenarioname; // 시나리오 이름
  String? bookmarkcount; // 즐겨찾기(별표) 수
  String? views; // 조회수
  bool? isbookmark; // 즐겨찾기 여부
  String? stiuation; //상황
  List<String>? genre; //장르
  List<String>? character; //등장인물
  String? maincharacter; //주인공

  Scenario({
    this.scenarioname,
    this.bookmarkcount,
    this.views,
    this.isbookmark,
    this.stiuation,
    this.genre,
    this.character,
    this.maincharacter,
  });

  Scenario.fromJson(Map<String, dynamic> json) {
    scenarioname = json['scenarioname'];
    bookmarkcount = json['bookmarkcount'];
    views = json['views'];
    isbookmark = json['isbookmark'];
    stiuation = json['stiuation'];
    genre = json['genre'].cast<String>();
    character = json['character'].cast<String>();
    maincharacter = json['maincharacter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scenarioname'] = scenarioname;
    data['bookmarkcount'] = bookmarkcount;
    data['views'] = views;
    data['isbookmark'] = isbookmark;
    data['stiuation'] = stiuation;
    data['genre'] = genre;
    data['character'] = character;
    data['maincharacter'] = maincharacter;

    return data;
  }
}
