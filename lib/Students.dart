class Students {
  Students({
    this.id,
    this.name,
    required this.scores,
  });
  late final int? id;
  late final String? name;
  late final List<Scores> scores;

  Students.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    scores = List.from(json['scores']).map((e)=>Scores.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['scores'] = scores.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Scores {
  Scores({
    required this.score,
    required this.type,
  });
  late final double score;
  late final String type;

  Scores.fromJson(Map<String, dynamic> json){
    score = json['score'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['score'] = score;
    _data['type'] = type;
    return _data;
  }
}