import 'package:my_football_manager/Support/Export/MyExport.dart';

class Standing_GDT {
  List<StandingGroupDT>? standingGroups;

  Standing_GDT({this.standingGroups});

  static Standing_GDT parseFromJson(Map<dynamic, dynamic> json) {
    List<StandingGroupDT>? _standingGroups = [];

    try {
      for (Map i in json["standings"]) {
        _standingGroups.add(StandingGroupDT.fromJson(i));
      }
    } catch (e) {}

    return Standing_GDT(standingGroups: _standingGroups);
  }
}
