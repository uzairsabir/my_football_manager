import 'package:my_football_manager/Support/Export/MyExport.dart';

class TeamsList_Main extends StatefulWidget implements ScreenLoadView {
  final Function() notifyParent;
  String title;
  double menuID;
  String parentMenuID;
  BuildContext context;

  TeamsList_Main(
      {required this.context,
      required this.notifyParent,
      required this.title,
      required this.menuID,
      required this.parentMenuID}) {
    loadView("");
  }

  @override
  Future loadView(String argument) async {
    // TODO: implement loadView
  }

  @override
  TeamsList createState() => TeamsList(
      notifyParent: notifyParent,
      title: title,
      menuID: menuID,
      parentMenuID: parentMenuID);
}

class TeamsList extends State<TeamsList_Main>
    implements ScreenItem1, Structure {
  final Function() notifyParent;

  TeamsList(
      {required this.notifyParent,
      required this.title,
      required this.menuID,
      required this.parentMenuID}) {}

  String title;
  double menuID;
  String parentMenuID;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(
          pageTitle: "${title}",
          rightIcon: Icons.clear,
          isBackButton: true,
          notificationCounter: 0,
          onRightChanged: (String value) {},
        ),
        body: Container(
          color: MyColor.getThemeColor(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: MyListView(
              isFavOnly: "",
              context: context,
              container: getItem1,
              parentMenuID: "${menuID}",
              axis: Axis.vertical,
              color: MyColor.getThemeColor(),
              isReversed: false,
              onChanged: (String value) async {
                await TeamDetailVM.clearAll();

                MyClickHandler().Open(
                    context,
                    TeamDetail_Main(
                        context: context,
                        notifyParent: refresh,
                        title: MyListGridVM(parentMenuID: "${menuID}")
                                .getItem(false, "")
                                .elementAt(int.parse(value))
                                .item1 ??
                            "",
                        menuID: MyListGridVM(parentMenuID: "${menuID}")
                                .getItem(false, "")
                                .elementAt(int.parse(value))
                                .menuID ??
                            0.0,
                        parentMenuID: parentMenuID));
              }),
        ));
  }

  @override
  Widget getItem1(int index, String parentMenuID, MyListGridVM item) {
    // TO`DO: implement getItem2
    String bodyData =
        "${item.item3}|${item.item4}|${item.item5}|${item.item6}|${item.item7}|${item.item8}";

    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: MyColor.getThemeColor(),
          borderRadius: BorderRadius.all(Radius.circular(10.0) //
              ),
          border: Border.all(width: 0.5, color: MyColor.background)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: MyProfileImage(
                      imageurl: item.item2!,
                      radius: 25,
                      onChanged: (String value) {})),
              MyText(
                  text: item.item1 ?? "",
                  maxLine: 1,
                  fontSize: MyFont.appTitleText,
                  marginFromLeft: 10,
                  marginFromTop: 10,
                  width: 0,
                  fontWeight: MyFont.fontWeightLight,
                  color: MyColor.background,
                  textAlign: TextAlign.center)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
            color: MyColor.background,
            height: 0.1,
          ),
          for (var i in bodyData.split("|"))
            MyText(
                text: i,
                maxLine: 1,
                fontSize: MyFont.normalTextSize,
                marginFromLeft: 10,
                marginFromTop: 10,
                width: 0,
                fontWeight: MyFont.fontWeightLight,
                color: MyColor.background,
                textAlign: TextAlign.left),
          // MyText(
          //     text: item.item4 ?? "",
          //     maxLine: 1,
          //     fontSize: MyFont.normalTextSize,
          //     marginFromLeft: 10,
          //     marginFromTop: 10,
          //     width: 0,
          //     fontWeight: MyFont.fontWeightLight,
          //     color: MyColor.background,
          //     textAlign: TextAlign.left),
          // MyText(
          //     text: item.item5 ?? "",
          //     maxLine: 1,
          //     fontSize: MyFont.normalTextSize,
          //     marginFromLeft: 10,
          //     marginFromTop: 10,
          //     width: 0,
          //     fontWeight: MyFont.fontWeightLight,
          //     color: MyColor.background,
          //     textAlign: TextAlign.left),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.only(right: 20),
                child: MyIcon(
                    onChanged: (String value) {
                      //MyText

                      MyListGridVM(parentMenuID: "${menuID}")
                          .updateItemFavStatus(item.menuID!.toDouble());

                      refresh();
                    },
                    iconData: item.item9 == "1"
                        ? Icons.favorite
                        : Icons.favorite_border_sharp,
                    color: MyColor.background,
                    size: 30,
                    text: item.item1!)),
          )
        ],
      ),
    );
  }

  @override
  void refresh() {
    // TODO: implement refresh
    setState(() {});
  }
}
