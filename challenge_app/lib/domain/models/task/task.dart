import 'dart:convert';

class Task {
  final String id;
  final List<String> keyWords;
  final int? finalPrice;
  final int? count;
  final String state;
  final Reviewed client;
  final Reviewed doer;
  //Las fechas se guardara en timeStamp
  final int date;
  int createdDated = DateTime.now().millisecondsSinceEpoch;
  final int? duration;

  Task({
    required this.id,
    required this.keyWords,
    this.finalPrice,
    this.count = 1,
    required this.state,
    required this.client,
    required this.doer,
    required this.date,
    this.duration
  });

  setCurrentTime() {
    createdDated = DateTime.now().microsecondsSinceEpoch;
  }

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
    id: json["id"],
    keyWords: json["keyWords"],
    finalPrice: json["finalPrice"],
    count: json["count"],
    state: json["state"],
    client: Reviewed.fromJson(json["client"]),
    doer: Reviewed.fromJson(json["doer"]),
    date: json["date"],
    duration: json["duration"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "keyWords": keyWords,
    "finalPrice": finalPrice,
    "count": count,
    "state": state,
    "client": Reviewed.fromMap(client.toMap()),
    "doer": Reviewed.fromMap(doer.toMap()),
    "date": date,
    "duration": duration
  };
}


class Reviewed {
    Reviewed({
        required this.idUser,
        required this.proposedPrice,
        this.review,
        this.score,
    });

    final String idUser;
    final int proposedPrice;
    final String? review;
    final double? score;

    factory Reviewed.fromJson(String str) => Reviewed.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Reviewed.fromMap(Map<String, dynamic> json) => Reviewed(
        idUser: json["id"],
        proposedPrice: json["proposed_price"],
        review: json["review"],
        score: json["score"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "id": idUser,
        "proposed_price": proposedPrice,
        "review": review,
        "score": score,
    };
}