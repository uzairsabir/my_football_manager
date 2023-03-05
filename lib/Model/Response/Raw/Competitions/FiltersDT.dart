class FiltersDT {
  String? season;

  FiltersDT({required this.season});

  factory FiltersDT.fromJson(Map<dynamic, dynamic> json) =>
      FiltersDT(season: json["season"] != null ? json["season"] : 0);
}
