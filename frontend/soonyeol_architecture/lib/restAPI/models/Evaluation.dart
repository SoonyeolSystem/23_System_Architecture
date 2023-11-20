class Evaluation {
  String? evaluation;
  int? rate;

  Evaluation({
    this.evaluation,
    this.rate,
  });

  // JSON serialization method
  Evaluation.fromJson(Map<String, dynamic> json) {
    evaluation = json['evaluation'].toString();
    rate = int.parse(json['rate'].toString());
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['evaluation'] = evaluation;
    data['rate'] = rate;

    return data;
  }
}
