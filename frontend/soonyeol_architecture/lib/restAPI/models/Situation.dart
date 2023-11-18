// class Situation {
//   String? situationname; // 시나리오 이름
//   int? bookmarkcount; // 즐겨찾기(별표) 수
//   int? views; // 조회수
//   bool? isbookmark; // 즐겨찾기 여부
//   String? situation; //상황
//   List<String>? genre; //장르
//   List<String>? character; //등장인물
//   String? maincharacter; //주인공
//   String? situationid; //상황 id
//   String? userName;
//   int? likeCount;

//   Situation({
//     this.situationname,
//     this.bookmarkcount,
//     this.views,
//     this.isbookmark,
//     this.situation,
//     this.genre,
//     this.character,
//     this.maincharacter,
//     this.userName,
//     this.likeCount
//   });

//   Situation.fromJson(Map<String, dynamic> json) {
//     situationname = json['title'];
//     bookmarkcount = json['bookmarkCnt'];
//     views = json['play'];
//     isbookmark = json['islike'];
//     situation = json['situation'];
//     if (json['genre'] != null) {
//       genre = json['genre'].split(',');
//     }
//     if (json['character'] != null) {
//       character = json['character'].split(',');
//     }
//     maincharacter = json['name'];
//     situationid = json['situationid'];
//     userName = json['userName'];
//     likeCount = json['likecount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = situationname;
//     data['bookmarkCnt'] = bookmarkcount;
//     data['play'] = views;
//     data['islike'] = isbookmark;
//     data['situation'] = situation;
//     data['genre'] = genre;
//     data['character'] = character;
//     data['name'] = maincharacter;
//     data['situationid'] = situationid;
//     data['userName'] = userName;
//     data['likecount'] = likeCount;

//     return data;
//   }
// }
class Situation {
  String? situation; // 상황
  String? userId; // 유저 아이디
  int? play; // 플레이 수
  int? timestamp; // 타임스탬프
  int? like; // 좋아요 수
  String? situationId; // 상황 아이디
  String? character; // 등장인물
  String? genre; // 장르
  String? name; // 이름
  String? title; // 제목
  String? userName;
  int? likeCount; // 좋아요 수

  Situation({
    this.situation,
    this.userId,
    this.play,
    this.timestamp,
    this.like,
    this.situationId,
    this.character,
    this.genre,
    this.name,
    this.title,
    this.userName,
    this.likeCount,
  });

  Situation.fromJson(Map<String, dynamic> json) {
    situation = json['situation'];
    userId = json['userid'];
    play = json['play'];
    timestamp = json['timestamp'];
    like = json['like'];
    situationId = json['situationid'];
    character = json['character'];
    genre = json['genre'];
    name = json['name'];
    title = json['title'];
    userName = json['userName'];
    likeCount = json['like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['situation'] = situation;
    data['userid'] = userId;
    data['play'] = play;
    data['timestamp'] = timestamp;
    data['like'] = like;
    data['situationid'] = situationId;
    data['character'] = character;
    data['genre'] = genre;
    data['name'] = name;
    data['title'] = title;
    data['userName'] = userName;
    data['like'] = likeCount;

    return data;
  }
}
