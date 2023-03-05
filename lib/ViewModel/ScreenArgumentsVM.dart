import 'package:hive/hive.dart';

import '../../Support/Constant/MyConstant.dart';

part 'ScreenArgumentsVM.g.dart';

@HiveType(typeId: HIVE_TYPE_2)
class ScreenArgumentsVM extends HiveObject {
  static String boxname = 'ScreenArgumentsVM';

  @HiveField(0)
  late String title;
  @HiveField(1)
  late double? menuID;
  @HiveField(2)
  final String? parentMenuID;
  @HiveField(3)
  final String? param_1;
  @HiveField(4)
  final String? param_2;
  @HiveField(5)
  final String? param_3;
  @HiveField(6)
  final String? param_4;
  @HiveField(7)
  final String? param_5;
  @HiveField(8)
  final String? param_6;
  @HiveField(9)
  final String? param_7;
  @HiveField(10)
  final String? param_8;
  @HiveField(11)
  final String? param_9;

  ScreenArgumentsVM({
    required this.title,
    this.menuID,
    this.parentMenuID,
    this.param_1,
    this.param_2,
    this.param_3,
    this.param_4,
    this.param_5,
    this.param_6,
    this.param_7,
    this.param_8,
    this.param_9,
  });

  static addItem(ScreenArgumentsVM item) async {
    clearAll(item.menuID!);

    final box = Hive.box<ScreenArgumentsVM>(ScreenArgumentsVM.boxname);

    box.add(item);
  }

  static ScreenArgumentsVM getItem(double menuID) {
    final box = Hive.box<ScreenArgumentsVM>(ScreenArgumentsVM.boxname)
        .values
        .where((element) => element.menuID == menuID);

    return box.isEmpty ? ScreenArgumentsVM(title: "") : box.first;
  }

  static clearAll(double menuID) {
    try {
      final box = Hive.box<ScreenArgumentsVM>(ScreenArgumentsVM.boxname)
          .values
          .where((element) => element.menuID == menuID);
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
