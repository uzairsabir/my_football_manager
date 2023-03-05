class TeamsDT {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  String? address;
  String? website;
  int? founded;
  String? clubColors;
  String? venue;

  TeamsDT({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
    required this.address,
    required this.website,
    required this.founded,
    required this.clubColors,
    required this.venue,
  });

  factory TeamsDT.fromJson(Map<dynamic, dynamic> json) => TeamsDT(
      id: json["id"] != null ? json["id"] : 0,
      name: json["name"] != null ? json["name"] : "",
      shortName: json["shortName"] != null ? json["shortName"] : "",
      tla: json["tla"] != null ? json["tla"] : "",
      crest: json["crest"] != null
          ? json["crest"]
          : "http://placehold.it/120x120&text=image1",
      address: json["address"] != null ? json["address"] : "",
      website: json["website"] != null ? json["website"] : "",
      founded: json["founded"] != null ? json["founded"] : 0,
      clubColors: json["clubColors"] != null ? json["clubColors"] : "",
      venue: json["venue"] != null ? json["venue"] : "");
}
