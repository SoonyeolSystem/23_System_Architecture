class Situation {
  String? situationname; // 시나리오 이름
  int? bookmarkcount; // 즐겨찾기(별표) 수
  int? views; // 조회수
  bool? isbookmark; // 즐겨찾기 여부
  String? stiuation; //상황
  List<String>? genre; //장르
  List<String>? character; //등장인물
  String? maincharacter; //주인공
  String? situationid; //상황 id
  String? userName;

  Situation({
    this.situationname,
    this.bookmarkcount,
    this.views,
    this.isbookmark,
    this.stiuation,
    this.genre,
    this.character,
    this.maincharacter,
    this.userName,
  });

  Situation.fromJson(Map<String, dynamic> json) {
    situationname = json['title'];
    bookmarkcount = json['bookmarkCnt'];
    views = json['play'];
    isbookmark = json['islike'];
    stiuation = json['stiuation'];
    if (json['genre'] != null) {
      genre = json['genre'].split(',');
    }
    if (json['character'] != null) {
      character = json['character'].split(',');
    }
    maincharacter = json['name'];
    situationid = json['situationid'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = situationname;
    data['bookmarkCnt'] = bookmarkcount;
    data['play'] = views;
    data['islike'] = isbookmark;
    data['stiuation'] = stiuation;
    data['genre'] = genre;
    data['character'] = character;
    data['name'] = maincharacter;
    data['situationid'] = situationid;
    data['userName'] = userName;

    return data;
  }
}
