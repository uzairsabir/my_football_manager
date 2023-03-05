import 'package:my_football_manager/Support/Export/MyExport.dart';

class MyGeneralListItem extends StatelessWidget {
  BuildContext context;
  MyListGridVM myListGridVM;
  final Function(String)? onEdit;
  final Function(String)? onSubmit;
  final Function(String)? onReject;
  final Function(String)? onDelete;
  final Function(String)? onView;

  MyGeneralListItem({
    required this.context,
    required this.myListGridVM,
    this.onEdit,
    this.onSubmit,
    this.onReject,
    this.onDelete,
    this.onView,
  });

  @override
  Widget build(BuildContext context) {
    //return generalListItem (this.myListGridVM);

    return generalListItem(this.myListGridVM);
  }

  Widget generalListItem(MyListGridVM item) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: generalItem1(item) ?? [Container()]);
  }

  List<Widget>? generalItem1(MyListGridVM item) {
    List<Widget> list = [];

    try {
      if (item.item1!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item1!.split("|")) getItemText(item)
        ]));

//      }
      }
    } catch (e) {}

    try {
      if (item.item2!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item2!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item3!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item3!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item4!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item4!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item5!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item5!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item6!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item6!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item7!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item7!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item8!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item8!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item9!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item9!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item10!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item10!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item11!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item11!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item12!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item12!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item13!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item13!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item14!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item14!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item15!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item15!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item16!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item16!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item17!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item17!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item18!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item18!.split("|")) getItemText(item)
        ]));
      }
    } catch (e) {}

    try {
      if (item.item19!.contains("|")) {
        list.add(new Row(children: [
          for (var item in item.item19!.split("|")) getItemText(item)
        ]));

        return list;
      }
    } catch (e) {}

    try {
      if (item.action!.contains("|")) {
        if (item.action!.split("|")[1].contains(",")) {
          list.add(new Row(children: [
            for (var item in item.action!.split("|")[1].split(","))
              getItembutton(item)
          ]));
        } else {
          list.add(
              new Row(children: [getItembutton(item.action!.split("|")[1])]));
        }

        return list;
      }
    } catch (e) {}

    return list;
  }

  Widget getItemText(String item) {
    return MyText(
        text: item,
        maxLine: 1,
        fontSize: MyFont.normalTextSize,
        marginFromLeft: 10,
        marginFromTop: 10,
        textAlign: TextAlign.start,
        width: item.contains(":")
            ? MediaQuery.of(context).size.width / 2.5
            : MediaQuery.of(context).size.width / 2.5);
  }

  Widget getItembutton(String item) {
    return MyButton(
        text: item,
        borderColor: item == MyLanguage.of(context)!.translateFromFile("Submit")
            ? MyColor.getThemeLight()
            : item == MyLanguage.of(context)!.translateFromFile("Delete")
                ? MyColor.getError()
                : item == MyLanguage.of(context)!.translateFromFile("Reject")
                    ? MyColor.getError()
                    : MyColor.getThemeLight(),
        backgroundColor: item ==
                MyLanguage.of(context)!.translateFromFile("Submit")
            ? MyColor.getThemeLight()
            : item == MyLanguage.of(context)!.translateFromFile("Delete")
                ? MyColor.getError()
                : item == MyLanguage.of(context)!.translateFromFile("Reject")
                    ? MyColor.getError()
                    : MyColor.getBackground(),
        textColor: item == MyLanguage.of(context)!.translateFromFile("Submit")
            ? MyColor.getBackground()
            : item == MyLanguage.of(context)!.translateFromFile("Delete")
                ? MyColor.getBackground()
                : item == MyLanguage.of(context)!.translateFromFile("Reject")
                    ? MyColor.getBackground()
                    : MyColor.getThemeLight(),
        hoverColor: MyColor.getThemeLight(),
        width: 70,
        margin: 10,
        topmargin: 20,
        onChanged: (String value) {
          //MyUtils.printMe("my_value_${value}");
          if (value == MyLanguage.of(context)!.translateFromFile("Edit")) {
            this.onEdit!("$value|${myListGridVM.menuID}");
          } else if (value ==
              MyLanguage.of(context)!.translateFromFile("Submit")) {
            this.onSubmit!("$value|${myListGridVM.menuID}");
          } else if (value ==
              MyLanguage.of(context)!.translateFromFile("Reject")) {
            this.onReject!(value);
          } else if (value ==
              MyLanguage.of(context)!.translateFromFile("View")) {
            this.onView!(value);
          } else if (value ==
              MyLanguage.of(context)!.translateFromFile("Delete")) {
            this.onDelete!("$value|${myListGridVM.menuID}");
          }
        });
  }
}
