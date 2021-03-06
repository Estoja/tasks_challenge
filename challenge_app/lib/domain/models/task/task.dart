import 'dart:convert';

class Task {
  final String id;
  final String title;
  final String description;
  final List<dynamic> keyWords;
  final int? finalPrice;
  final int? count;
  final String state;
  final Reviewed client;
  Reviewed? doer;
  final DateTime scheduleDate;
  DateTime createdDate = DateTime.now();
  final int? duration;

  Task({
    this.id = '',
    required this.title,
    required this.description,
    required this.keyWords,
    this.finalPrice = 0,
    this.count = 1,
    this.state = "NEW",
    required this.client,
    this.doer,
    required this.scheduleDate,
    this.duration = 0
  });


  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    keyWords: json["keyWords"],
    finalPrice: json["finalPrice"],
    count: json["count"],
    state: json["state"],
    scheduleDate: DateTime.parse(json["scheduleDate"]),
    duration: json["duration"],
    client: Reviewed.fromJson((json["client"])),
    doer: Reviewed.fromJson(json["doer"] ?? {"id": "", "proposed_price": 0}),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "keyWords": keyWords,
    "finalPrice": finalPrice,
    "count": count,
    "state": state,
    "scheduleDate": scheduleDate.toString(),
    "duration": duration,
    "client": Reviewed.fromMap(client.toMap()),
    "doer": doer!= null?
          Reviewed.fromMap(doer!.toMap()) :
          Reviewed.fromMap({"id": "", "proposed_price": 0}),
  };
}


class Reviewed {
    Reviewed({
        required this.idUser,
        required this.proposedPrice,
        this.review = '',
        this.score = 0.0,
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
        review: json["review"] ?? '',
        score: json["score"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "id": idUser,
        "proposed_price": proposedPrice,
        "review": review,
        "score": score,
    };
}