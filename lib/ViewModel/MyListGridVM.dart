import 'package:hive/hive.dart';
import 'package:my_football_manager/Support/Export/MyExport.dart';

part 'MyListGridVM.g.dart';

@HiveType(typeId: HIVE_TYPE_1)
class MyListGridVM extends HiveObject {
  static String boxname = 'MyListViewVM';

  @HiveField(0)
  late double? menuID;
  @HiveField(1)
  late String? item1;
  @HiveField(2)
  late String? item2;
  @HiveField(3)
  late String? item3;
  @HiveField(4)
  late String? item4;
  @HiveField(5)
  late String? item5;
  @HiveField(6)
  late String? item6;
  @HiveField(7)
  late String? item7;
  @HiveField(8)
  late String? item8;
  @HiveField(9)
  late String? item9;
  @HiveField(10)
  late String? item10;
  @HiveField(11)
  late String? item11;
  @HiveField(12)
  late String? item12;
  @HiveField(13)
  late String? item13;
  @HiveField(14)
  late String? item14;
  @HiveField(15)
  late String? item15;
  @HiveField(16)
  late String? item16;
  @HiveField(17)
  late String? item17;
  @HiveField(18)
  late String? item18;
  @HiveField(19)
  late String? item19;
  @HiveField(20)
  late String parentMenuID;
  @HiveField(21)
  late String? action;

  MyListGridVM(
      {required this.parentMenuID,
      this.menuID,
      this.item1,
      this.item2,
      this.item3,
      this.item4,
      this.item5,
      this.item6,
      this.item7,
      this.item8,
      this.item9,
      this.item10,
      this.item11,
      this.item12,
      this.item13,
      this.item14,
      this.item15,
      this.item16,
      this.item17,
      this.item18,
      this.item19,
      this.action});

  addItem(MyListGridVM item) async {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    box.add(item);
  }

  Box getItem1() {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    // final b = box.values.where((item) {
    //   return item.parentMenuID == this.parentMenuID;
    // });

    // if (isReversed) return b.toList().reversed;
    return box;
  }

  Iterable<MyListGridVM> getItem(bool isReversed, String isFavOnly) {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    if (box.length > 0) {
      final b = box.values.where((item) {
        if (isFavOnly == "1") {
          // MyUtils.printMe("item_is_${this.parentMenuID}_${item.item9}");
          return item.parentMenuID == this.parentMenuID && item.item9 == "1";
        } else {
          return item.parentMenuID == this.parentMenuID;
        }
      });

      if (isReversed) return b.toList().reversed;
      return b;
    }

    return box.values;
  }

  updateItemFavStatus(double menuID) {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    // MyUtils.printMe("parent_id_${this.parentMenuID}");

    final b = box.values.where((item) {
      return item.parentMenuID == this.parentMenuID && item.menuID == menuID;
    });

    // MyUtils.printMe("parent_id_${b.length}");

    b.forEach((element) {
      element.item9 = element.item9 == "0" ? "1" : "0";
      element.save();
    });
  }

  updateItemStatusToZero(String parentMenuID) {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    final b = box.values.where((item) {
      return item.parentMenuID == parentMenuID;
    });

    b.forEach((element) {
      element.item1 = "0";
      element.save();
    });
  }

  updateItemStatus(double menuID) {
    MyUtils.printMe("my_menu_id_${menuID}");
    updateItemStatusToZero("1");
    updateItemStatusToZero("2");
    updateItemStatusToZero("3");

    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    final b = box.values.where((item) {
      return item.parentMenuID == this.parentMenuID;
    });

    b.forEach((element) {
      if (element.menuID == menuID) {
        element.item1 = "1";
        element.save();
      } else {
        element.item1 = "0";
        element.save();
      }
    });
  }

  String getItemStatus(double menuID) {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    final b = box.values.where((item) {
      return item.parentMenuID == this.parentMenuID && item.menuID == menuID;
    });

    if (b.length > 0) {
      return b.first.item1!;
    }
    return "0";
  }

  updateItem(int index, MyListGridVM inventory) {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    box.putAt(index, inventory);
  }

  deleteItem(int index) {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    box.deleteAt(index);

    getItem(false, "");
  }

  clearAll(BuildContext context) async {
    try {
      final box = Hive.box<MyListGridVM>(MyListGridVM.boxname)
          .values
          .where((element) => element.parentMenuID == this.parentMenuID);
      // MyUtils.printMe("print_value_${box.toList().length}");

      if (box.length > 0) {
        box.forEach((element) async {
          await element.delete();

          //await element.save();
        });
      }
    } catch (e) {}
  }

  clearItem(double menuID) async {
    try {
      final box = Hive.box<MyListGridVM>(MyListGridVM.boxname)
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

  insertHome(BuildContext context, int id, String greetings, String name,
      String code, String type, String imageUrl) async {
    await MyListGridVM(parentMenuID: this.parentMenuID).clearAll(context);

    await addItem(MyListGridVM(
        parentMenuID: this.parentMenuID,
        menuID: id.toDouble(),
        item1: greetings,
        item2: name,
        item3: code,
        item4: type,
        item5: imageUrl));

    // await addItem(MyListGridVM(
    //     parentMenuID: this.parentMenuID,
    //     menuID: 1.0,
    //     item1: Menu.Teams.name,
    //     item2: "Test.png"));
  }

  //           int? id;
  // String? name;
  // String? shortName;
  // String? tla;
  // String? crest;
  // String? address;
  // String? website;
  // int? founded;
  // String? clubColors;
  // String? venue;

  insertFav(
      BuildContext context,
      int id,
      String name,
      String shortName,
      String tla,
      String crest,
      String address,
      String website,
      String founded,
      String venue) async {
    //MyUtils.printMe("parent_id_${this.parentMenuID}_${id.toDouble()}");

    if (!isExist(id, name, crest, shortName, tla, address, website,
        founded.toString(), venue)) {
      await addItem(MyListGridVM(
          parentMenuID: this.parentMenuID,
          menuID: id.toDouble(),
          item1: name,
          item2: crest,
          item3: shortName,
          item4: tla,
          item5: address,
          item6: website,
          item7: founded.toString(),
          item8: venue,
          item9: "0"));
    }
  }

  bool isExist(int id, String name, String shortName, String tla, String crest,
      String address, String website, String founded, String venue) {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

    final b = box.values.where((item) {
      return item.parentMenuID == this.parentMenuID &&
          item.menuID == id.toDouble();
    });

    MyUtils.printMe("is_parent_id_${b.length}");

    if (b.length > 0) {
      b.forEach((element) {
        element.item1 = name;
        element.item2 = shortName;
        element.item3 = tla;
        element.item4 = crest;
        element.item5 = address;
        element.item6 = website;
        element.item7 = founded;
        element.item8 = venue;
        element.save();
      });

      return true;
    }
    return false;
  }

  insertSetting(BuildContext context) async {
    await MyListGridVM(parentMenuID: this.parentMenuID).clearAll(context);
    await addItem(MyListGridVM(
      parentMenuID: this.parentMenuID,
      menuID: 1.0,
      item1: "Settings",
    ));
  }

  static Future clearAllAdd() async {
    final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);
    await box.clear();
  }

  static int getHeightForListItemCard(MyListGridVM item) {
    var height = 1;

    if ((item.item1 ?? "").isNotEmpty) height++;
    if ((item.item2 ?? "").isNotEmpty) height++;
    if ((item.item3 ?? "").isNotEmpty) height++;
    if ((item.item4 ?? "").isNotEmpty) height++;
    if ((item.item5 ?? "").isNotEmpty) height++;
    if ((item.item6 ?? "").isNotEmpty) height++;
    if ((item.item7 ?? "").isNotEmpty) height++;
    if ((item.item8 ?? "").isNotEmpty) height++;
    if ((item.item9 ?? "").isNotEmpty) height++;
    if ((item.item10 ?? "").isNotEmpty) height++;
    if ((item.item11 ?? "").isNotEmpty) height++;
    if ((item.item12 ?? "").isNotEmpty) height++;
    if ((item.item13 ?? "").isNotEmpty) height++;
    if ((item.item14 ?? "").isNotEmpty) height++;
    if ((item.item15 ?? "").isNotEmpty) height++;
    if ((item.item16 ?? "").isNotEmpty) height++;
    if ((item.item17 ?? "").isNotEmpty) height++;
    if ((item.item18 ?? "").isNotEmpty) height++;
    if ((item.item19 ?? "").isNotEmpty) height++;

    return height;
  }

  clearItemWithParentMenuID(double menuID) async {
    try {
      final box = Hive.box<MyListGridVM>(MyListGridVM.boxname).values.where(
          (element) =>
              element.menuID == menuID &&
              element.parentMenuID == this.parentMenuID);
      // MyUtils.printMe("print_value_${box.toList().length}");

      if (box.length > 0) {
        box.forEach((element) async {
          await element.delete();

          //await element.save();
        });
      }
    } catch (e) {}
  }

  double getNextMenuID(double id) {
    try {
      final box = Hive.box<MyListGridVM>(MyListGridVM.boxname);

      final b = box.values.where((item) {
        return item.parentMenuID == this.parentMenuID;
      });

      if (b.isNotEmpty) {
        return (b.last.menuID)! + 0.1;
      }
    } catch (e) {}

    MyUtils.printMe("my_id_is ${id + 0.1}_${this.parentMenuID}");

    return id + 0.1;
  }

  String getMainTitle(BuildContext context) {
    if (MyListGridVM(parentMenuID: "${menuID}").getItem(false, "").length > 0) {
      return (MyListGridVM(parentMenuID: "${menuID}")
              .getItem(false, "")
              .first
              .item1 ??
          "");
    }

    return MyLanguage.of(context)!
        .translateFromFile("Welcome To The Football Manager \n Season 2022");
    ;
  }
}
