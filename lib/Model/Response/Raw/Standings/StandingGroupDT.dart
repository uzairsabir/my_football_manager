import 'package:my_football_manager/Support/Export/MyExport.dart';

class StandingGroupDT {
  String? stage;
  String? type;
  String? group;
  List<StandingTableDT>? tablesDT;

  StandingGroupDT(
      {required this.stage,
      required this.type,
      required this.group,
      required this.tablesDT});

  factory StandingGroupDT.fromJson(Map<dynamic, dynamic> json) =>
      StandingGroupDT(
        stage: json["stage"] != null ? json["stage"] : "0",
        type: json["type"] != null ? json["type"] : "0",
        group: json["group"] != null ? json["group"] : "0",
        tablesDT: getTables(json),
      );

  static List<StandingTableDT>? getTables(Map<dynamic, dynamic> json) {
    List<StandingTableDT>? tablesDT = [];

    try {
      for (Map i in json["table"]) {
        tablesDT.add(StandingTableDT.fromJson(i));
      }
    } catch (e) {}

    return tablesDT;
  }
}
