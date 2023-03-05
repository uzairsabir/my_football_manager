import 'package:my_football_manager/Support/Export/MyExport.dart';

class StandingTableDT {
  int? position;
  int? playedGames;
  int? won;
  int? draw;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;
  StandingTeamsDT teams;

  StandingTableDT({
    required this.position,
    required this.playedGames,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
    required this.teams,
  });

  factory StandingTableDT.fromJson(Map<dynamic, dynamic> json) =>
      StandingTableDT(
          position: json["position"] != null ? json["position"] : 0,
          playedGames: json["playedGames"] != null ? json["playedGames"] : 0,
          won: json["won"] != null ? json["won"] : 0,
          draw: json["draw"] != null ? json["draw"] : 0,
          lost: json["lost"] != null ? json["lost"] : 0,
          points: json["points"] != null ? json["points"] : 0,
          goalsFor: json["goalsFor"] != null ? json["goalsFor"] : 0,
          goalsAgainst: json["goalsAgainst"] != null ? json["goalsAgainst"] : 0,
          goalDifference:
              json["goalDifference"] != null ? json["goalDifference"] : 0,
          teams: StandingTeamsDT.fromJson(json["team"]));
}
