import 'package:hive/hive.dart';

import '../../Support/Constant/MyConstant.dart';

part 'TeamDetailVM.g.dart';

@HiveType(typeId: HIVE_TYPE_3)
class TeamDetailVM extends HiveObject {
  static String boxname = 'TeamDetailVM';

  @HiveField(0)
  late String stage;
  @HiveField(1)
  late String? group;
  @HiveField(2)
  final String? position;
  @HiveField(3)
  final String? played;
  @HiveField(4)
  final String? won;
  @HiveField(5)
  final String? draw;
  @HiveField(6)
  final String? lost;
  @HiveField(7)
  final String? points;
  @HiveField(8)
  final String? goalsFor;
  @HiveField(9)
  final String? goalsAgainst;
  @HiveField(10)
  final String? goalDifference;
  @HiveField(11)
  final String? crest;

  TeamDetailVM({
    required this.stage,
    required this.group,
    required this.position,
    required this.played,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
    required this.crest,
  });

  static addItem(TeamDetailVM item) async {
    clearAll();

    final box = Hive.box<TeamDetailVM>(TeamDetailVM.boxname);

    box.add(item);
  }

  static TeamDetailVM getItem() {
    final box = Hive.box<TeamDetailVM>(TeamDetailVM.boxname).values;

    return box.length > 0
        ? box.first
        : TeamDetailVM(
            stage: "",
            group: "",
            position: "",
            played: "",
            won: "",
            draw: "",
            lost: "",
            points: "",
            goalsFor: "",
            goalsAgainst: "",
            goalDifference: "",
            crest: "");
  }

  static clearAll() {
    try {
      final box = Hive.box<TeamDetailVM>(TeamDetailVM.boxname).values;
      // MyUtils.printMe("print_value_${box.toList().length}");

      if (box.length > 0) {
        box.forEach((element) async {
          await element.delete();

          //await element.save();
        });
      }
    } catch (e) {}
  }
}
