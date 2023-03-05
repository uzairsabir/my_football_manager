class StandingTeamsDT {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;

  StandingTeamsDT(
      {required this.id,
      required this.name,
      required this.shortName,
      required this.tla,
      required this.crest});

  factory StandingTeamsDT.fromJson(Map<dynamic, dynamic> json) =>
      StandingTeamsDT(
          id: json["id"] != null ? json["id"] : 0,
          name: json["name"] != null ? json["name"] : "",
          shortName: json["shortName"] != null ? json["shortName"] : "",
          tla: json["tla"] != null ? json["tla"] : "",
          crest: json["crest"] != null ? json["crest"] : "");
}
