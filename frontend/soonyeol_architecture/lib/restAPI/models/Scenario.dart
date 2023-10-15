class Scenario {
  String? name; // 시나리오 이름
  String? bookmarkcount; // 즐겨찾기(별표) 수
  String? views; // 조회수
  bool? isbookmark; // 즐겨찾기 여부

  Scenario({
    this.name,
    this.bookmarkcount,
    this.views,
    this.isbookmark,
  });

  Scenario.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bookmarkcount = json['bookmarkcount'];
    views = json['views'];
    isbookmark = json['isbookmark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['bookmarkcount'] = bookmarkcount;
    data['views'] = views;
    data['isbookmark'] = isbookmark;

    return data;
  }
}
