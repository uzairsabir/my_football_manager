class CompetitionsDT {
  int? id;
  String? name;
  String? code;
  String? type;
  String? emblem;

  CompetitionsDT(
      {required this.id,
      required this.name,
      required this.code,
      required this.type,
      required this.emblem});

  factory CompetitionsDT.fromJson(Map<dynamic, dynamic> json) => CompetitionsDT(
      id: json["id"] != null ? json["id"] : 0,
      name: json["name"] != null ? json["name"] : "",
      code: json["code"] != null ? json["code"] : "",
      type: json["type"] != null ? json["type"] : "",
      emblem: json["emblem"] != null
          ? json["emblem"]
          : "http://placehold.it/120x120&text=image1");
}
