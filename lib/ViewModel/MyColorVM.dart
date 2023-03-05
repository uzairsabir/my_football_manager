import 'package:hive/hive.dart';
import 'package:my_football_manager/Support/Export/MyExport.dart';

part 'MyColorVM.g.dart';

@HiveType(typeId: HIVE_TYPE_0)
class MyColorVM extends HiveObject {
  static String boxname = 'MyColorVM';

  // static const theme = Color(0xFF9B59B6);
  // static const themeLight = Color(0x669B59B6);
  // static const background = Color(0xffFFFFFF);
  // static const appBarText = Color(0xffFFFFFF);
  // static const appText = Color(0xff808080);
  // static const fullTransparent = Color(0x00000000);
  // static const backgroundblack_transparent = Color(0x7F000000);
  // static const error = Color(0xFFFF9494);

  @HiveField(0)
  late int? itemID;

  @HiveField(1)
  late int? theme;

  @HiveField(2)
  late int? themeLight;

  @HiveField(3)
  late int? background;

  @HiveField(4)
  late int? appBarText;

  @HiveField(5)
  late int? appText;

  @HiveField(6)
  late int? fullTransparent;

  @HiveField(7)
  late int? backgroundblack_transparent;

  @HiveField(8)
  late int? error;

  @HiveField(9)
  late int? success;

  @HiveField(10)
  late bool? isActive;

  @HiveField(11)
  late int? extraColor1;

  @HiveField(12)
  late int? extraColor2;

  @HiveField(13)
  late int? extraColor3;

  @HiveField(14)
  late int? hintColor;

  MyColorVM(
      {this.itemID,
      this.theme,
      this.themeLight,
      this.background,
      this.appBarText,
      this.appText,
      this.fullTransparent,
      this.backgroundblack_transparent,
      this.error,
      this.success,
      this.isActive,
      this.extraColor1,
      this.extraColor2,
      this.extraColor3,
      this.hintColor});

  addItem(MyColorVM item) async {
    final box = Hive.box<MyColorVM>(MyColorVM.boxname);

    box.add(item);
  }

  activeNewTheme(int itemID) {
    final box = Hive.box<MyColorVM>(MyColorVM.boxname);
    if (box.length > 0) {
      for (var item in box.values) {
        item.isActive = false;
        item.save();
      }

      final b = box.values.where((element) => element.itemID == itemID);
      b.first.isActive = true;
      b.first.save();
    }
  }

  Box<MyColorVM> getItem() {
    final box = Hive.box<MyColorVM>(MyColorVM.boxname);

    return box;
  }

  updateItem(int index, MyColorVM inventory) {
    final box = Hive.box<MyColorVM>(MyColorVM.boxname);

    box.putAt(index, inventory);
  }

  deleteItem(int index) {
    final box = Hive.box<MyColorVM>(MyColorVM.boxname);

    box.deleteAt(index);

    getItem();
  }

  clearAllAdd() {
    final box = Hive.box<MyColorVM>(MyColorVM.boxname);
    box.deleteAll(box.keys);

    addItem(MyColorVM(
        itemID: 1,
        theme: 0xFF1789FC,
        themeLight: 0x1A1789FC,
        background: 0xFFF2F2F2,
        appBarText: 0xFF006D5B,
        appText: 0xff696969,
        fullTransparent: 0x00000000,
        backgroundblack_transparent: 0x7F000000,
        error: 0xFFFF9494,
        success: 0xFF4cbb17,
        isActive: true,
        extraColor1: 0xFFAA336A,
        extraColor2: 0xFFFFC0CB,
        extraColor3: 0xFFFFC0CB,
        hintColor: 0xFFC1C1C1));

    // const primaryColor = Color(0xFF2697FF);
    // const secondaryColor = Color(0xFF2A2D3E);
    // const bgColor = Color(0xFF212332);

    addItem(MyColorVM(
        itemID: 2,
        theme: 0xFF019188,
        themeLight: 0x3B019188,
        background: 0xFFEEEDE7,
        appBarText: 0xFF006D5B,
        appText: 0xff696969,
        fullTransparent: 0x00000000,
        backgroundblack_transparent: 0x7F000000,
        error: 0xFFFF9494,
        success: 0xFF4cbb17,
        isActive: false,
        extraColor1: 0xFFAA336A,
        extraColor2: 0xFFFFC0CB,
        extraColor3: 0xFFFFC0CB,
        hintColor: 0xFFC1C1C1));

    addItem(MyColorVM(
      itemID: 3,
      theme: 0xFF303030,
      themeLight: 0xFF757575,
      background: 0xFFEEEDE7,
      appBarText: 0xFF006D5B,
      appText: 0xff696969,
      fullTransparent: 0x00000000,
      backgroundblack_transparent: 0x7F000000,
      error: 0xFFFF9494,
      success: 0xFF4cbb17,
      isActive: false,
    ));
  }

  // 100% — FF
  // 99% — FC
  // 98% — FA
  // 97% — F7
  // 96% — F5
  // 95% — F2
  // 94% — F0
  // 93% — ED
  // 92% — EB
  // 91% — E8
  // 90% — E6
  // 89% — E3
  // 88% — E0
  // 87% — DE
  // 86% — DB
  // 85% — D9
  // 84% — D6
  // 83% — D4
  // 82% — D1
  // 81% — CF
  // 80% — CC
  // 79% — C9
  // 78% — C7
  // 77% — C4
  // 76% — C2
  // 75% — BF
  // 74% — BD
  // 73% — BA
  // 72% — B8
  // 71% — B5
  // 70% — B3
  // 69% — B0
  // 68% — AD
  // 67% — AB
  // 66% — A8
  // 65% — A6
  // 64% — A3
  // 63% — A1
  // 62% — 9E
  // 61% — 9C
  // 60% — 99
  // 59% — 96
  // 58% — 94
  // 57% — 91
  // 56% — 8F
  // 55% — 8C
  // 54% — 8A
  // 53% — 87
  // 52% — 85
  // 51% — 82
  // 50% — 80
  // 49% — 7D
  // 48% — 7A
  // 47% — 78
  // 46% — 75
  // 45% — 73
  // 44% — 70
  // 43% — 6E
  // 42% — 6B
  // 41% — 69
  // 40% — 66
  // 39% — 63
  // 38% — 61
  // 37% — 5E
  // 36% — 5C
  // 35% — 59
  // 34% — 57
  // 33% — 54
  // 32% — 52
  // 31% — 4F
  // 30% — 4D
  // 29% — 4A
  // 28% — 47
  // 27% — 45
  // 26% — 42
  // 25% — 40
  // 24% — 3D
  // 23% — 3B
  // 22% — 38
  // 21% — 36
  // 20% — 33
  // 19% — 30
  // 18% — 2E
  // 17% — 2B
  // 16% — 29
  // 15% — 26
  // 14% — 24
  // 13% — 21
  // 12% — 1F
  // 11% — 1C
  // 10% — 1A
  // 9% — 17
  // 8% — 14
  // 7% — 12
  // 6% — 0F
  // 5% — 0D
  // 4% — 0A
  // 3% — 08
  // 2% — 05
  // 1% — 03
  // 0% — 00
}
