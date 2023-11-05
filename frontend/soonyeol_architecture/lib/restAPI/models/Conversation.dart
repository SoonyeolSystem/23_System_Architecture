class Conversation {
  String? situationname; // 시나리오 이름
  int? likeCount; // 좋아요 수
  int? views; // 조회수
  bool? isLike; // 좋아요 여부
  String? stiuation; //상황
  List<String>? genre; //장르
  List<String>? character; //등장인물
  String? maincharacter; //주인공
  String? userName; //대화 유저
  String? headScript; //대화내용
  int? epcohTime; //대화시간
  bool? endStory;
  String? situationID;
  String? conversationID;

  Conversation({
    this.situationname,
    this.likeCount,
    this.views,
    this.isLike,
    this.stiuation,
    this.genre,
    this.character,
    this.maincharacter,
    this.userName,
    this.headScript,
    this.epcohTime,
    this.endStory,
    this.situationID,
    this.conversationID,
  });

  Conversation.fromJson(Map<String, dynamic> json) {
    situationname = json['title'];
    likeCount = json['like'];
    views = json['view'];
    isLike = json['islike'];
    stiuation = json['stiuation'];
    if (json['genre'] != null) {
      genre = json['genre'].split(',');
    }
    if (json['character'] != null) {
      character = json['character'].split(',');
    }
    maincharacter = json['name'];
    userName = json['userName'];
    headScript = json['headScript'];
    epcohTime = json['timestamp'];
    endStory = json['end_story'].toLowerCase() != 'false';
    situationID = json['situationid'];
    conversationID = json['conversationid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['situationname'] = situationname;
    data['likeCount'] = likeCount;
    data['views'] = views;
    data['isLike'] = isLike;
    data['stiuation'] = stiuation;
    data['genre'] = genre;
    data['character'] = character;
    data['name'] = maincharacter;
    data['userName'] = userName;
    data['conversation'] = headScript;
    data['timestamp'] = epcohTime;
    data['end_story'] = endStory;
    data['situationid'] = situationID;
    data['conversationid'] = conversationID;
    return data;
  }
}
