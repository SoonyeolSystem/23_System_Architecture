class Scenario {
  String? name; // 시나리오 이름
  String? like; // 즐겨찾기(별표) 수
  String? views; // 조회수
  bool? isLiked; // 즐겨찾기 여부

  Scenario({
    this.name,
    this.like,
    this.views,
    this.isLiked,
  });

  Scenario.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    like = json['like'];
    views = json['views'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['like'] = like;
    data['views'] = views;
    data['isLiked'] = isLiked;

    return data;
  }
}
