class Conversation {
  String? scenarioname; // 시나리오 이름
  int? likeCount; // 좋아요 수
  int? views; // 조회수
  bool? isLike; // 좋아요 여부
  String? stiuation; //상황
  List<String>? genre; //장르
  List<String>? character; //등장인물
  String? maincharacter; //주인공
  String? userName; //대화 유저
  List<String>? conversation; //대화내용
  String? talkingtime; //대화시간

  Conversation({
    this.scenarioname,
    this.likeCount,
    this.views,
    this.isLike,
    this.stiuation,
    this.genre,
    this.character,
    this.maincharacter,
    this.userName,
    this.conversation,
    this.talkingtime,
  });

  Conversation.fromJson(Map<String, dynamic> json) {
    scenarioname = json['scenarioname'];
    likeCount = json['likeCount'];
    views = json['views'];
    isLike = json['isLike'];
    stiuation = json['stiuation'];
    genre = json['genre'].cast<String>();
    character = json['character'].cast<String>();
    maincharacter = json['maincharacter'];
    userName = json['userName'];
    conversation = json['conversation'].cast<String>();
    talkingtime = json['talkingtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scenarioname'] = scenarioname;
    data['likeCount'] = likeCount;
    data['views'] = views;
    data['isLike'] = isLike;
    data['stiuation'] = stiuation;
    data['genre'] = genre;
    data['character'] = character;
    data['maincharacter'] = maincharacter;
    data['userName'] = userName;
    data['conversation'] = conversation;
    data['talkingtime'] = talkingtime;

    return data;
  }
}
