import 'package:my_football_manager/Support/Export/MyExport.dart';

class Competition_GDT {
  List<TeamsDT>? teamDT;
  FiltersDT? filtersDT;
  CompetitionsDT? competitionDT;

  Competition_GDT({this.teamDT, this.filtersDT, this.competitionDT});

  static Competition_GDT parseFromJson(Map<dynamic, dynamic> json) {
    List<TeamsDT>? _teamsDT = [];
    FiltersDT? _filterDT;
    CompetitionsDT? _competitionDT;

    try {
      for (Map i in json["teams"]) {
        _teamsDT.add(TeamsDT.fromJson(i));
      }
    } catch (e) {}

    try {
      _filterDT = FiltersDT.fromJson(json["filters"]);
    } catch (e) {}

    try {
      _competitionDT = CompetitionsDT.fromJson(json["competition"]);
    } catch (e) {}

    return Competition_GDT(
        teamDT: _teamsDT, filtersDT: _filterDT, competitionDT: _competitionDT);
  }
}
