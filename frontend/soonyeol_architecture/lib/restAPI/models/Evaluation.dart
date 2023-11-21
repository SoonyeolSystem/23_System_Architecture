class Evaluation {
  String? evaluation;
  int? rate;
  int? speakingcount;
  int? speakingSpeed;


  Evaluation({this.evaluation, this.rate, this.speakingcount, this.speakingSpeed});

  // JSON serialization method
  Evaluation.fromJson(Map<String, dynamic> json) {
    evaluation = json['evaluation'].toString();
    rate = int.parse(json['rate'].toString());
    speakingcount = json['speakingcount'];
    speakingSpeed = json['speakingspeed'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['evaluation'] = evaluation;
    data['rate'] = rate;
    data['speakingcount'] = speakingcount;
    data['speakingspeed'] = speakingSpeed;

    return data;
  }
}
